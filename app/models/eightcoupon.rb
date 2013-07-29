class Eightcoupon < ActiveRecord::Base

include HTTParty
require 'open-uri'
require 'json'

attr_accessible :zip



  def local_deals
    HTTParty.get("http://api.8coupons.com/v1/getdeals?key=49bf9fac2c055141e65a2d9bd03064a1cd06069f59b9941403b24ea60ffcb8296bb6d954a145f830ed072500d4d213f8&zip=#{zip}&mileradius=20&limit=1&orderby=radius&categoryid=2,6")
  end

  def deal_title
    local_deals'dealDiscountPercent'
  end

def NY_local_deals
open("http://api.8coupons.com/v1/getdeals?key=49bf9fac2c055141e65a2d9bd03064a1cd06069f59b9941403b24ea60ffcb8296bb6d954a145f830ed072500d4d213f8&zip=#{zip}&mileradius=20&limit=1000&orderby=radius&categoryid=2,6") do |f|
  json_string = f.read
  parsed_json = JSON.parse(json_string)
  location = parsed_json['dealTitle']['name']
  here = parsed_json['address']['city']
  print "Get this deal #{location} at #{here}\n"
end
end

end
