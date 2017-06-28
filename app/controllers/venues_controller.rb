class VenuesController < ApplicationController
  def new_venue
    @venue=Venue.new
  end
  def create_venue
	@venue=Venue.new(venue_params)
    if @venue.save
     redirect_to new_match_path
    else
      flash[:failure]="something went wrong"
      redirect_to new_match_path
     end
  end
private 
def venue_params
 params.require(:venue).permit(:stadium, :city)
end
end