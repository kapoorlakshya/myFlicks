class AllFlicksController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to root_url, notice: "You must be signed in to access other pages!"
    else
      all_user_flicks = Flick.all.to_a # All flicks in Flick table
      @active_flicks_data = Array.new # Store imdb_data of active flicks

      @current_user_list = Array.new # Flicks in current user's list

      all_user_flicks.each { |f|
        begin
          # Fetch data for active flicks
          active_flicks_by_users = ImdbDatum.find(f.imdb_id) 
          if active_flicks_by_users
            @active_flicks_data.push(active_flicks_by_users) # Populate active_flicks array to print flicks on index
          end
      
          # Show quick_add_button only if user doesn't have the flick in their list
          if f.user_id == current_user.id
            @current_user_list.push(active_flicks_by_users.imdb_id)
          end
        rescue
          next
        end
      }

      @active_flicks_data.uniq!
    end
  end
end
