class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :bed_detail
      t.string :number_of_person
      t.boolean :smoking_allowed
      t.float :room_size_value
      t.string :room_size_unit
      t.boolean :adults_only
      t.boolean :wheel_chair_accessible
      t.string :bed_type
      t.integer :bed_count
      t.references :block, foreign_key: true
      t.references :room_type, foreign_key: true

      t.timestamps
    end
  end
end
