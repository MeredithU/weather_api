class Forecast < ActiveRecord::Base

  include HTTParty
  require 'open-uri' #required for the do block at the bottom
  require 'json' #required for the do block at the bottom

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

  def wunderground
    open('http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/IA/Cedar_Rapids.json') do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      location = parsed_json['location']['city']
      temp_f = parsed_json['current_observation']['temp_f']
      print "Current temperature in #{location} is: #{temp_f}\n"
    end
  end
end
