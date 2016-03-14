class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.string :slug, limit: 30

      t.timestamps null: false
    end
    add_index :users, :slug, unique: true
  end
end