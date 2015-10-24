
class HyperNews2ch < Matome

  def name
    'Hyper News 2ch'
  end

  def url
    'http://hypernews.2chblog.jp/atom.xml'
  end

  def item_key
    'entry'
  end

  def link_key_type
    :attr_href
  end

end

class Joshikiteki < Matome

  def name
    '常識的に考えた'
  end

  def url
    'http://blog.livedoor.jp/jyoushiki43/atom.xml'
  end

  def item_key
    'entry'
  end

  def link_key_type
    :attr_href
  end

end

class Alphalpha < Matome

  def name
    'アルファルファ'
  end

  def url
    'http://alfalfalfa.com/index.rdf'
  end

end

class Watch2channel < Matome

  def name
    'watch@2チャンネル'
  end

  def url
    'http://watch2ch.2chblog.jp/index.rdf'
  end

end

class News2ch < Matome

  def name
    'ニュース2ちゃんねる'
  end

  def url
    'http://news020.blog13.fc2.com/?xml'
  end

end
