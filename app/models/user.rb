class User < ActiveRecord::Base
  has_one :student, primary_key: :login, foreign_key: :name
  has_many :homeworks, through: :students

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.login = auth["info"]["nickname"]
    end
  end
end
