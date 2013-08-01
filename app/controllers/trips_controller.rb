class TripsController < ApplicationController

  def index
   # @json = Trip.all.to_gmaps4rails
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      flash[:notice] = "Trip saved."
      redirect_to @trip
    else
      #later
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

end
