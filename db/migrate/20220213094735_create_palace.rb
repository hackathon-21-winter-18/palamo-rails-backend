class CreatePalace < ActiveRecord::Migration[7.0]
  def change
    create_table :palaces, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :originalID, limit: 36, null: false
      t.string :name, limit: 30, null: false
      t.string :created_by, limit: 36, null: false
      t.string :held_by, limit: 36, null: false
      t.integer :number_of_embeded_pins, default: 0
      t.boolean :share, default: false
      t.integer :saved_count, default: 0
      t.datetime :shared_at
      t.boolean :firstshared, default: false
      t.datetime :firstshared_at
      t.string :group1, default: ""
      t.string :group2, default: ""
      t.string :group3, default: ""

      t.timestamps
    end
  end
end
