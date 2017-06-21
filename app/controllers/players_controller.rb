class PlayersController < ApplicationController
  def index
  end
  def new
	  @player=Player.new
  end
  def edit
    @player=Player.find(params[:id])
  end
  def manage_players
    @player=Player.all
  end
  def create
    @player=Player.new(player_params)
    if(@player.save)
      flash[:success] ="Player Registered Successfully"
      redirect_to new_player_path
    else
      flash[:error] ="Pease add the necessary fields"
      redirect_to new_player_path
    end
  end
  def update
    @player=Player.find(params[:id])
    if(@player.update(player_params))
      redirect_to manage_players_path
      flash[:success] ="updated Successfully"
    else
      render 'edit'
      flash[:failure] ="something went wrong"
    end
  end
  def destroy
    @player=Player.find(params[:id])
    @contrat=Contract.select(:player_id).where(:player_id=>@player.id)
  
   if @contrat.blank?
     flash[:success]="player is deleted" 
  redirect_to manage_players_path
   @player.destroy
  else
  
    flash[:failure]="Error....player is in contrat with a team" 
    redirect_to manage_players_path
  end
end

private
  def player_params
    params.require(:player).permit(:name, :age)
  end
end