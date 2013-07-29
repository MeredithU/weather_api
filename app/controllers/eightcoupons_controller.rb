class EightcouponsController < ApplicationController

def index

  end

  def new
    @eightcoupon = Eightcoupon.new
  end

  def create
    @eightcoupon = Eightcoupon.new(params[:eightcoupon])
    if @eightcoupon.save
      flash[:notice] = "Deal saved."
      redirect_to @eightcoupon
    else
      #later
    end
  end

  def show
    @eightcoupon = Eightcoupon.find(params[:id])
  end

end


