class Student < ActiveRecord::Base
  has_many :homeworks
  has_many :assignments, through: :homeworks
end
