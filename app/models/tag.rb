class Tag < ActiveRecord::Base
  validates :tag, :uniqueness => true, :presence => true
  
end