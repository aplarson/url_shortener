# == Schema Information
#
# Table name: short_urls
#
#  id           :integer          not null, primary key
#  long_url     :string(255)
#  short_url    :string(255)
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ShortUrl < ActiveRecord::Base
  validates :short_url, :long_url, :submitter_id, :presence => true
  validates :short_url, :uniqueness => true
  
  include SecureRandom
  
  belongs_to(
    :submitter,
    :class_name => "User",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )
  
  has_many(
    :visits,
    :class_name => 'Visit',
    :foreign_key => :url_id,
    :primary_key => :id
  )
  
  has_many(
    :visitors,
    Proc.new { distinct },
    :through => :visits,
    :source => :visitor
  )
  
  has_many(
    :url_tags,
    :class_name => "UrlTag",
    :foreign_key => :url_id,
    :primary_key => :id
  )
  
  has_many(
    :tags,
    :through => :url_tags,
    :source => :tag
  )
  
  def self.random_code
    code = SecureRandom.base64(12)
    code = SecureRandom.base64(12) while ShortUrl.exists?(:short_url => code)
    code
  end
  
  def self.create_for_user_and_long_url!(user, long_url)
    self.create! :submitter_id => user.id, 
                 :long_url => long_url, 
                 :short_url => self.random_code
  end
  
  def num_clicks
    visits.select(:visitor_id).count
  end
  
  def num_uniques
    visitors.select(:visitor_id).count
  end
  
  def num_recent_uniques
    visitors
      .select(:visitor_id)
      .where("visits.created_at > ?", 10.minutes.ago).count
  end
end
