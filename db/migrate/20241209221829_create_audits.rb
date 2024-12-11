class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.references :admin
      t.string :action
      t.text :description
      t.references :auditable, polymorphic: true
      t.timestamps
    end
    add_index :audits, :admin_id
  end
end
