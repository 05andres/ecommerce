module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :audits, as: :auditable
    after_create :audit_create
    after_update :audit_update
  end

  private

  def current_admin
    @current_admin ||= Thread.current[:current_admin]
  end

  def audit_create
    p "########################"
    p "create audit for #{self}"
    p "########################"

    if current_admin
      Audit.create!(
        auditable: self,
        action: 'create',
        description: "Created a #{self.class.name.downcase} with name #{self.name}",
        admin: @current_admin
      )
    else
      Rails.logger.error("Audit creation failed: current_admin is not available")
    end
  end

  def audit_update
    p "update audit"
    changes = previous_changes.except(:updated_at)
    description = "#{self.class.name.downcase} updated. Changes: #{changes.map { |field, change| "#{field}: #{change[0]} -> #{change[1]}" }.join(', ')}"
    if current_admin
      Audit.create!(
        auditable: self,
        action: 'update',
        description: description,
        admin_id: @current_admin.id
      )
    else
      Rails.logger.error("Audit creation failed: current_admin is not available")
    end
  end
end
