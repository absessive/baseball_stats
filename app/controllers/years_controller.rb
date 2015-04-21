class YearsController < ApplicationController
  before_filter :check_user, only: [:new, :create, :destroy]

  def new
    @year = Year.new
  end

  def create
    @year = Year.create( year_params )
    Player.get_players_from_xml_and_add(@year)
    redirect_to root_path
  end

  private

# Use strong_parameters for attribute whitelisting
  def year_params
    params.require(:year).permit(:year, :file)
  end

# Allow to upload only if user is logged in
  def check_user
    unless user_signed_in?
      redirect_to root_url, alert: "Sorry, only authorized users can add."
    end
  end
end
