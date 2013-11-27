class HomeController < ApplicationController
  def index
    @flicks = ImdbDatum.first(10)
  end
end
