class HomeController < ApplicationController
  def index
    imdb_array = Array.new
    ImdbDatum.all.each { |i|
      imdb_array.push(i)
    }
    @imdb_data = imdb_array.uniq

    flick_array = Array.new
    Flick.all.each { |f|
      flick_array.push(f)
    }
    @flicks = flick_array.uniq
  end
end
