class Audit < ActiveRecord::Base
  attr_accessible :action, :description, :auditable, :admin
  belongs_to :auditable, polymorphic: true
  belongs_to :admin
end
