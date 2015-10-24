require 'singleton'
require 'net/http'
require 'rexml/document'

class Matome

  include Singleton

  Article = Struct.new(:title, :link)

  attr_reader :articles

  class << self

    def all_matome
      subclasses.map{|site|
        site.instance
      }
    end

    private

    def subclasses
      @subclasses = []
      ObjectSpace.each_object(singleton_class) do |k|
        @subclasses << k if k.superclass == self
      end
      @subclasses
    end

  end

  def initialize()
    @articles = []
    Thread.start do
      while true
        create_articles(5)
        sleep 10.minutes
      end
    end
  end

  def create_articles(count)
    uri = URI.parse(url)
    res = Net::HTTP.get uri
    xml = REXML::Document.new(res)
    @articles = []
    xml.elements.first.elements.each(item_key) do |e|
      break if (count -= 1)  < 0
      title = e.elements['title'].text
      link = get_link(e.elements)
      @articles << Article.new(title, link)
    end
  end

  def item_key
    'item'
  end

  def link_key
    'link'
  end

  def link_key_type
    :text
  end

  private

  def get_link(element)
    case link_key_type
    when :text
      element[link_key].text
    when :attr_href
      element[link_key].attributes['href']
    else
      raise 'link key type is wrong!'
    end
  end

end