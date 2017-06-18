class PlayersController < ApplicationController
  def index
  end
  def new
	  @player=Player.new
  end
  def create
    @player=Player.new(player_params)
    if(@player.save)
      flash[:success] ="Player Registered Successfully"
      redirect_to new_player_path
    else
      flash[:error] ="Registration failed"
      redirect_to new_player_path
    end
  end

private
  def player_params
    params.require(:player).permit(:name, :age)
  end
end