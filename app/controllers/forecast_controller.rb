class ForecastController < ApplicationController

  require 'open-uri'
  require 'json'

  open('http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/IA/Cedar_Rapids.json') do |f|
    json_string = f.read
    parsed_json = JSON.parse(json_string)
    location = parsed_json['location']['city']
    temp_f = parsed_json['current_observation']['temp_f']
    puts "Current temperature in #{location} is: #{temp_f}\n"
  end


  def index

  end

end
