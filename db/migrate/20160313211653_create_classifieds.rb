class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title, limit: 100, null: false
      t.decimal :price, null: false
      t.string :location, limit: 25, null: false
      t.text :description
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :slug, null: false

      t.timestamps null: false
    end
    add_index :classifieds, :slug, unique: true
  end
end
