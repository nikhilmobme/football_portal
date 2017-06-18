class MatchsController < ApplicationController
	def add_matchs
		@match=Match.new
    @team=Team.all
	end
  def fix_match
    @match=Match.new
    @match.venue= params[:match][:venue]
    @match.date= params[:match][:date]
    @match.team1_id=params[:team1_id]
    @match.team2_id=params[:team2_id]
    @match.save!
    flash[:success]="match successfully fixed"
    redirect_to new_lineup_path(@match)
  end
  def schduled_matchs
    @match=Match.all
  end
end
