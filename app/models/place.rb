class Place < ActiveRecord::Base
  has_many :photos
  serialize :hours
end
