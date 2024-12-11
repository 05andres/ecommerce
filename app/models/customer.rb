class Customer < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :purchases
end
