class HomeController < ApplicationController
  def index
    @recent_flicks = Array.new
    @current_user_list = Array.new
    @user_flicks = Flick.find(:all)

    @user_flicks.each { |f| 
      begin
        flick_in_user_list = ImdbDatum.find(f.imdb_id)
        if flick_in_user_list
          @recent_flicks.push(flick_in_user_list)
        end

        if f.user_id == current_user.id
          @current_user_list.push(flick_in_user_list.imdb_id)
        end
      rescue
        next
      end
    }
    @recent_flicks.reverse!.uniq!
  end
end
