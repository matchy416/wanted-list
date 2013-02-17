# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  username        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :username, :password, :password_confirmation
  has_secure_password

  before_save :create_remember_token
  before_save do |user|
  	user.email = user.email.downcase
  	user.username = user.username.downcase
  end

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  				uniqueness: {case_sensitive: false}
  validates :username, presence: true, length: { maximum: 30 }, 
  				uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
