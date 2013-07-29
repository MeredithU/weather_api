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

  def self.local_deals
    HTTParty.get("http://api.8coupons.com/v1/getdeals?key=49bf9fac2c055141e65a2d9bd03064a1cd06069f59b9941403b24ea60ffcb8296bb6d954a145f830ed072500d4d213f8&zip=10001&mileradius=20&limit=1000&orderby=radius&categoryid=2,6")
  end


  def self.response
    HTTParty.get("http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/WA/Seattle.json")
  end

  def self.country
    country = "US"
    HTTParty.get("http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/#{country}.json")
  end

  def self.country_name
    ::CountrySelect::COUNTRIES[country]
  end

  def self.countryselect
    @country = Country.new(params[:country])
    HTTParty.get("http://api.wunderground.com/api/80c09000360316c5/geolookup/conditions/q/#{country}.json")
  end

  def self.current_observation
    response['current_observation']
  end


end
