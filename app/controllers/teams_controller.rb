class TeamsController < ApplicationController
   

  def index 
    @team=Team.all
  end
	def new
	  @team=Team.new
	end
  def manage_teams
    
    @team=Team.find(params[:format])
    @player_array={}
    @contract=Contract.select(:player_id).where(:team_id=>@team.id)
    @contract.each do |contract|
    @player= Player.find(contract.player_id)
    @player_array.merge!({@player.id=>@player.name})
    
    end
    
  end
  def edit
  @team=Team.find(params[:id])
  end
  def update

    @team=Team.find(params[:id])
    if(@team.update(team_params))
      redirect_to manage_teams_path(@team)
      flash[:success] ="updated Successfully"
    else
      render 'edit'
      flash[:failure] ="something went wrong"
    end
  end
  def destroy
    @team=Team.find(params[:id])
    @match=Match.where("team1_id=#{@team.id} or team2_id=#{@team.id}")
    #@match1=Match.select(:team2_id).where(:team2_id=>@team.id)
    if @match.blank?
      @contract=Contract.where("team_id=#{@team.id}") 
      @contract.each do |contract|

      contract.destroy
     end
       @team.destroy
      flash[:success] ="team deleted"
      redirect_to teams_path
      
    else
      
      flash[:failure] ="you can't delete the team now"
      redirect_to teams_path
    end


  end



	def create
    @team=Team.new(team_params)
    if(@team.save)
      flash[:success] ="Team Registered Successfully"
      redirect_to new_team_path
    else
      flash[:success] ="Please add the team name"
      redirect_to new_team_path
    end
  end
private
  def team_params
    params.require(:team).permit(:name)
  end
end
