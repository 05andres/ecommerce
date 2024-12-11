class Category < ActiveRecord::Base
  attr_accessible :name, :creator
  has_many :products
  has_many :audits, as: :auditable
  belongs_to :creator, class_name: 'Admin'
end
