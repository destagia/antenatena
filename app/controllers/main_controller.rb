class MainController < ApplicationController

  include ApplicationHelper

  def index

    @matomes = Matome.all_matome

  end

end
