class City < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :state, :gmaps

  acts_as_gmappable

  def gmaps4rails_address
  "#{name}, #{state}"
end

end
