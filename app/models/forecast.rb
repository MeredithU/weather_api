class Forecast < ActiveRecord::Base

  attr_accessible :country

  def country_name
    ::CountrySelect::COUNTRIES[country]
  end

end
