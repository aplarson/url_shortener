# == Schema Information
#
# Table name: tags
#
#  id  :integer          not null, primary key
#  tag :string(255)
#

class Tag < ActiveRecord::Base
  validates :tag, :uniqueness => true, :presence => true
  
  has_many(
    :url_tags,
    :class_name => "UrlTag",
    :foreign_key => :tag_id,
    :primary_key => :id  
  )
  
  has_many(
    :urls, 
    :through => :url_tags,
    :source => :url
  )
end
