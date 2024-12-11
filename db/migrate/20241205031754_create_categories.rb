class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.timestamps
      t.references :creator, foreign_key: { to_table: :admins }
    end
  end
end
