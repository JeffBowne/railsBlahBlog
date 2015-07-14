class User < ActiveRecord::Base
  has_secure_password
  scope :signed_in_today, -> { where( 'last_signed_in between ? and ?', Time.now-1.day, Time.now)}
  has_one :profile
  has_many :posts
  has_many :comments

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: {minimum: 4, maximum: 14}

  validates :password, confirmation: true, presence: true
end
