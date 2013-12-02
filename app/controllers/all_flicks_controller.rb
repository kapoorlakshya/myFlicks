class AllFlicksController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to root_url, notice: "You must be signed in to access other pages!"
    else
      @active_flicks = Array.new
      @not_in_current_user_flicks = Array.new
      @all_user_flicks = Flick.all

      @all_user_flicks.each { |f|
        begin
          active_flicks_by_users = ImdbDatum.find(f.imdb_id)
          if active_flicks_by_users
            @active_flicks.push(active_flicks_by_users)
          end

          if f.user_id != current_user.id
            @not_in_current_user_flicks.push(f.imdb_id)
          end
        rescue
          next
        end
      }
      @active_flicks.uniq!
    end
  end
end
