class LineupsController < ApplicationController
 def new_lineup
 	
 	@match =Match.find(params[:format])
 	@team1=Team.find(@match.team1_id)
 	@team2=Team.find(@match.team2_id)

@lineup=Lineup.new

 end
 def store_lineup

 end
 def view_lineup
 end
end
