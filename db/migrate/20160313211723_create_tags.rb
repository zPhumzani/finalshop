class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, limit: 20, null: false

      t.timestamps null: false
    end
    add_index :tags, :name, unique: true
  end
end
