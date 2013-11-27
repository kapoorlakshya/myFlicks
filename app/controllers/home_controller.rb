class HomeController < ApplicationController
  def index
    @flicks = ImdbDatum.last(5)
  end
end
