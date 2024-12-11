class Product < ActiveRecord::Base
  include Auditable
  attr_accessible :name, :price, :description, :creator, :category
  has_many :purchases
  belongs_to :creator, class_name: 'Admin'
  belongs_to :category
end
