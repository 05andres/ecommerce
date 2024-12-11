class Category < ActiveRecord::Base
  include Auditable
  attr_accessible :name, :creator
  has_many :products
  belongs_to :creator, class_name: 'Admin'
end
