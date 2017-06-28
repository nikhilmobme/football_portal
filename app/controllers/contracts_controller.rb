class ContractsController < ApplicationController
  def new_contracts
    @team=Team.find(params[:format])
    @add_players=Player.where("id not in(select player_id from contracts)")
    @contract=Contract.select(:player_id).where(:team_id=>@team.id)
    @player_array={}
    @contract.each do|contract|
      @player=Player.find(contract.player_id)
      @player_array.merge!({@player.id=>@player.name})
    end
  end
  def remove_players
    @team_id=params[:team_id]
    player_id=params[:player_id]
    @lineup=Lineup.find_by(:team_id=>@team_id)
    if @lineup.blank?
      player_id.each do |id|
        @contract=Contract.find_by(:player_id=>id)
        @contract.destroy
      end
      redirect_to  manage_teams_path(@team_id)
      flash[:success]="players removed from the  team"
    else
      redirect_to  manage_teams_path(@team_id)
      flash[:failure]="line up exists... can't remove"
    end
  end
  def add_players
    team_id=params[:team_id]
    bal_players=params[:bal_players]
 	  player_id = params[:player_id]
    if player_id
    if bal_players.to_i<player_id.size.to_i
      flash[:failure]="player limits exists"
      redirect_to new_contracts_path(team_id)
    else
      player_id.each do|player_id|
   	    @contract=Contract.new
   	    @contract.player_id=player_id
   	    @contract.team_id=team_id
   	    @contract.save!
      end
      redirect_to teams_path
      flash[:success]="players succesfully added to teams"
    end
  else
     flash[:failure]="choose players to add"
     redirect_to new_contracts_path(team_id)
   end

  end
end
