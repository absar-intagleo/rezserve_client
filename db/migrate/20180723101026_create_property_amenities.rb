class CreatePropertyAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :property_amenities do |t|
      t.references :amenity, foreign_key: true
      t.references :amenity_type, foreign_key: true
      t.integer :reference_id

      t.timestamps
    end
  end
end
