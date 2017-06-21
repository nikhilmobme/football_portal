class LineupsController < ApplicationController
  def new_lineup
    @match =Match.find(params[:format])
    @team1=Team.find(@match.team1_id)
    @team2=Team.find(@match.team2_id)
    @lineup=Lineup.new
    @contract1=Contract.select(:player_id).where(:team_id=>@team1.id)
    @contract2=Contract.select(:player_id).where(:team_id=>@team2.id)
  end
  def store_lineup
  if !params[:iscaption] || !params[:isgoalkeeper] || !params[:iscaption2] || !params[:isgoalkeeper2]
    flash[:failure]="Please select all fields for both teams"
    redirect_to new_lineup_path(params[:lineup][:match_id])
else
 	@contract =Contract.select(:player_id).where(:team_id=>params[:lineup][:team1_id])
 	@contract.each do |contract|
 	  p="#{contract.player_id}Position"
 	  p= params[:"#{p}"]
      @lineup=Lineup.new
 	  @lineup.match_id=params[:lineup][:match_id]
 	  @lineup.team_id=params[:lineup][:team1_id]
 	  @lineup.player_id=contract.player_id
      cap=params[:iscaption]
      goal=params[:isgoalkeeper]
	  if cap.to_s != contract.player_id.to_s	
 		@lineup.is_caption=0
 	  else
 		@lineup.is_caption=1
      end
      if goal.to_s !=contract.player_id.to_s 	
 		@lineup.is_keeper=0
 		@lineup.position=p
 	  else
 		@lineup.is_keeper=1
 		@lineup.position="GoalKeeper"
      end
      @lineup.save
 	end
 	@contract2 =Contract.select(:player_id).where(:team_id=>params[:lineup][:team2_id])
 	  @contract2.each do |contract2|
 	  p="#{contract2.player_id}Position"
 	  p= params[:"#{p}"]
      @lineup2=Lineup.new
 	  @lineup2.match_id=params[:lineup][:match_id]
 	  @lineup2.team_id=params[:lineup][:team2_id]
 	  @lineup2.player_id=contract2.player_id
      cap=params[:iscaption2]
      goal=params[:isgoalkeeper2]
      if cap.to_s != contract2.player_id.to_s	
 		 @lineup2.is_caption=0
 	  else
 		@lineup2.is_caption=1
      end
      if goal.to_s !=contract2.player_id.to_s 	
 		@lineup2.is_keeper=0
 		@lineup2.position=p
 	  else
 		@lineup2.is_keeper=1
 		@lineup2.position="GoalKeeper"
      end
      @lineup2.save
 	end  	
    redirect_to schduled_matchs_path
  end
end
  def view_lineup
    @match=Match.find(params[:format])
    @team1=Team.find_by(:id=>@match.team1_id)
    @team2=Team.find_by(:id=>@match.team2_id)
    @lineup1=Lineup.where("match_id=#{@match.id} and team_id=#{@team1.id}")
    @lineup2	=Lineup.where("match_id=#{@match.id} and team_id=#{@team2.id}")
end
end
