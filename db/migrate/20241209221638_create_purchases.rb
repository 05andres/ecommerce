class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :product, foreign_key: true
      t.references :customer, foreign_key: true
      t.decimal :total_amount
      t.integer :quantity
      t.timestamps
    end
    add_index :purchases, :product_id
    add_index :purchases, :customer_id
  end
end
