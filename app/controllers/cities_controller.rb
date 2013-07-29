class CitiesController < ApplicationController

  def index
    #@cities = City.all
    @json = City.all.to_gmaps4rails
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params[:city])
    if @city.save
      flash[:notice] = "City has been saved."
      redirect_to @city
    else
      #later
    end
  end

  def show
    @city = City.find(params[:id])
  end

end
