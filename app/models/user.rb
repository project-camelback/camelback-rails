# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  access_token :string(255)
#

class User < ActiveRecord::Base
end
