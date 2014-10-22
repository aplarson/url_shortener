# == Schema Information
#
# Table name: url_tags
#
#  id     :integer          not null, primary key
#  url_id :integer
#  tag_id :integer
#

class UrlTag < ActiveRecord::Base
  validates :url_id, :tag_id, presence: true
  
  belongs_to(
    :tag,
    :class_name => "Tag",
    :foreign_key => :tag_id,
    :primary_key => :id  
  )
  
  belongs_to(
    :url,
    :class_name => "ShortUrl",
    :foreign_key => :url_id,
    :primary_key => :id
  )
end
