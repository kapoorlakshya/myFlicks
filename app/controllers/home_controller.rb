class HomeController < ApplicationController
  def index
    @recent_flicks = Array.new
    @user_flicks = Flick.find(:all)

    @user_flicks.each { |f| 
      begin
        flick_in_user_list = ImdbDatum.find(f.imdb_id)
        if flick_in_user_list
          @recent_flicks.push(flick_in_user_list)
        end
      rescue
        next
      end
    }
    @recent_flicks.uniq!
  end
end
