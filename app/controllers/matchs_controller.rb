class MatchsController < ApplicationController
	def add_matchs
		@match=Match.new
    @venue=Venue.all
    @team=Team.all
	end
  def edit_schdule
    @match=Match.find(params[:format])
    @team=Team.all
    @venue=Venue.all
    #@team1=Team.find_by(:team_id=>@match.team1_id)
    #@team2=Team.find_by(:team_id=>@match.team2_id)
  end
  def update_match
  
    @match=Match.find(params[:match][:match_id])
    if (@match.team1_id.to_s != params[:team1_id].to_s || @match.team2_id.to_s !=params[:team2_id].to_s)
      flash[:failure]="You Cant change the team here" 
      redirect_to edit_schdule_path(@match)
    else 
      @match.venue= params[:venue]
      @match.date= params[:match][:date]
      if @match.save! 
        redirect_to schduled_matchs_path
      else
        flash[:failure]="something went wrong"
        render 'edit_schdule'
      end
    end
  end
  def delete_schdule
    @match=Match.find(params[:format])
    @lineup=Lineup.select(:match_id).where(:match_id=>@match.id)
    @lineup.each do |lineup|
      lineup.destroy
    end
    @match.destroy
    redirect_to schduled_matchs_path
    flash[:success]="schdule is deleted"
  end
  def fix_match
    @match=Match.new
    @contract1=Contract.select(:player_id).where(:team_id=>params[:team1_id])
    @contract2=Contract.select(:player_id).where(:team_id=>params[:team2_id])
    if params[:team1_id].to_s == params[:team2_id].to_s
      flash[:failure]="select two different teams"
      redirect_to new_match_path 
    else
      if @contract1.size.to_s != "7" || @contract2.size.to_s != "7"
        flash[:failure]="please check team balance"
        redirect_to new_match_path 
      else
        @match.venue= params[:venue]
        @match.date= params[:date]
        @match.team1_id=params[:team1_id]
        @match.team2_id=params[:team2_id]
        @match.save!
        flash[:success]="match successfully fixed"
        redirect_to new_lineup_path(@match)
      end
    end
  end
  def schduled_matchs
    @match=Match.order(:date)
  end
end
