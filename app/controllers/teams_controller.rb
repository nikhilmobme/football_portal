class TeamsController < ApplicationController
  def index 
    @team=Team.all
  end
	def new
	  @team=Team.new
	end
	def create
    @team=Team.new(team_params)
    if(@team.save)
      flash[:success] ="Team Registered Successfully"
      redirect_to new_team_path
    else
      flash[:success] ="Team Registaction failed"
      redirect_to new_team_path
    end
  end
private
  def team_params
    params.require(:team).permit(:name)
  end
end
