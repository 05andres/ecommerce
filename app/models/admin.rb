class Admin < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password

  validates :name, :presence => true
  validates :email, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }

  before_save :downcase_email



  def downcase_email
    self.email.downcase!
  end
end
