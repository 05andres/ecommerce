class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product, foreign_key: true
      t.string :url

      t.timestamps
    end
    add_index :images, :product_id
  end
end
