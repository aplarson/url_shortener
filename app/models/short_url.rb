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

end
