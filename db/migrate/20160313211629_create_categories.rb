class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 30
      t.string :slug, limit: 30
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true
    add_index :categories, :slug, unique: true
  end
end
