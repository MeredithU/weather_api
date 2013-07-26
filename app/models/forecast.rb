class Forecast < ActiveRecord::Base

  include HTTParty

  attr_accessible :country, :zip

  def country_name
    ::CountrySelect::COUNTRIES[country]
  end

  def weather
    HTTParty.get("http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/#{country}.json")
  end

  def zip_weather
    HTTParty.get("http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/#{zip}.json")
  end

  def conditions
    zip_weather['current_observation']
  end

  def temp_c
    zip_weather['temp_c']
  end
end
