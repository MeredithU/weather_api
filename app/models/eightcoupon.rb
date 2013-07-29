class Eightcoupon < ActiveRecord::Base

include HTTParty
require 'open-uri'
require 'json'

attr_accessible :zip

  def local_deals
    HTTParty.get("http://api.8coupons.com/v1/getdeals?key=49bf9fac2c055141e65a2d9bd03064a1cd06069f59b9941403b24ea60ffcb8296bb6d954a145f830ed072500d4d213f8&zip=#{zip}&mileradius=20&limit=3&orderby=radius&categoryid=2,6")
  end

end
