class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :google_id, limit: 21, null: false
      t.string :name, limit: 20, null: false

      t.timestamps
    end
    add_index :users, :name, unique: true
  end
end
