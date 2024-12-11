class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
    add_index :customers, :email, :unique => true
  end
end