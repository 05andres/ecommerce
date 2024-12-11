class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category
      t.string :name
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.references :creator, foreign_key: { to_table: :admins }
      t.timestamps
    end
    add_index :products, :category_id
  end
end
