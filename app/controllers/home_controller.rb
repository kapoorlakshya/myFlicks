class HomeController < ApplicationController
  def index
    @flicks = ImdbDatum.all
  end
end
