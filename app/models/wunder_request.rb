class WunderRequest
  include HTTParty

  def self.temp(system = "c")
    if system == "c"
      current_observation['temp_c']
    elsif system == "f"
      current_observation['temp_f']
    else
      raise "Whaddya want, kelvin?"
    end
  end

  def self.response
    HTTParty.get("http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/WA/Seattle.json")
  end

  def self.current_observation
    response['current_observation']
  end
end

