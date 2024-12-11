class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :creator, :category
  has_many :purchases
  has_many :audits, as: :auditable
  belongs_to :creator, class_name: 'Admin'
  belongs_to :category
end
