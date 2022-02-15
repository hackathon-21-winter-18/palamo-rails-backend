class CreateEmbededPin < ActiveRecord::Migration[7.0]
  def change
    create_table :embeded_pins, id: false do |t|
      t.integer :number, null: false
      t.integer :x, null: false
      t.integer :y, null: false
      t.string :word, limit: 15
      t.string :place, limit: 15
      t.string :situation, limit: 15
      # これは必要
      t.string :palace_id, limit: 36, null: false
      t.integer :group_number, default: 0
      # t.references :palaces, foreign_key: true

      t.timestamps
    end
    add_foreign_key :embeded_pins, :palaces
  end
end
