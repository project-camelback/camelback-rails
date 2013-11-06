# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Assignment < ActiveRecord::Base

  def get_forks
    # scan the repo for forks
    @private_assignments.first.rels[:forks].get.data

    # if current user name is found,
    #   display link to their repo in the assignments list
  end
end
