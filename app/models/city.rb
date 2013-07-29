class City < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :state, :gmaps, :zipcode

  acts_as_gmappable

  def gmaps4rails_address
  "#{zipcode}"
  end

end
