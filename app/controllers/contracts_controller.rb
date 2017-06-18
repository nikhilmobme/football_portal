class ContractsController < ApplicationController
  def new_contracts
    @team=Team.find(params[:format])
    @player=Player.where("id not in(select player_id from contracts)")
  end
  def add_players
    team_id=params["team_id"]
 	 player_id = params[:player_id]
    player_id.each do|player_id|
   	@contract=Contract.new
   	@contract.player_id=player_id
   	@contract.team_id=team_id
   	@contract.save!
    end
    redirect_to teams_path
    flash[:success]="players succesfully addedd to teams"
  end
end
