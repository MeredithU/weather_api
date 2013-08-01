class Excuse < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :cover_story

  has_many :trips
end
