class Forecast < ActiveRecord::Base
  include HTTParty
  attr_accessible :country

  def country_name
    ::CountrySelect::COUNTRIES[country]
  end

  def weather
    HTTParty.get("http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/#{country}.json")
  end

end
