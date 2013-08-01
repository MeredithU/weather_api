class Trip < ActiveRecord::Base

include HTTParty
require 'open-uri'
require 'json'


  attr_accessible :latitude, :longitude, :name, :state, :gmaps, :endzip, :startzip, :cover_story, :myarray

  #acts_as_gmappable

  #def gmaps4rails_address
  #  "#{name}, #{state}"
  #end

  def excuse
    myarray = ['Kevin Spacey stole my bicycle','It was not in the original specification', 'I will have to fix that at a later date','It must be because of leap year','Godzilla pulled me over in a stolen cop car','A stunt double stole my identity', 'A British chap put me inside a Chinese finger trap', 'The entire Roman empire spin kicked my collar bone',  'Princess Peach beat me into submission', 'Scrooge McDuck hid my Trapper Keeper', 'Chuck E Cheese broke into my house', 'Raiden from Mortal Kombat tried to sell me vacuum cleaners',  'Eddie Murphy put a banana inside my tail pipe', 'My fake tarantuala kept telling me knock knock jokes', 'I swerved to avoid banana peels on the roadway' ]
    cover_story = myarray[rand(myarray.length)]
    return cover_story
  end

  def local_deals
    HTTParty.get("http://api.8coupons.com/v1/getdeals?key=49bf9fac2c055141e65a2d9bd03064a1cd06069f59b9941403b24ea60ffcb8296bb6d954a145f830ed072500d4d213f8&zip=#{endzip}&mileradius=20&limit=3&orderby=radius&categoryid=2,6")
  end

  def zip_weather
    HTTParty.get("http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/#{endzip}.json")
  end

  def conditions
    zip_weather['current_observation']
  end
end
