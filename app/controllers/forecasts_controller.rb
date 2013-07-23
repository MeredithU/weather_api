class ForecastsController < ApplicationController

  def index

  end

  def new
    @forecast = Forecast.new
  end

  def create
    @forecast = Forecast.new(params[:forecast])
    if @forecast.save
      flash[:notice] = "Forecast saved."
      redirect_to @forecast
    else
      #later
    end
  end

end
