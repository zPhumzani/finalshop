class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30, null: false
      t.string :last_name, limit: 30, null: false
      t.boolean :admin, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end
    add_index :users, :slug, unique: true
  end
end
