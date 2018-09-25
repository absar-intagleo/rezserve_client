class AddColumnsToAmenities < ActiveRecord::Migration[5.2]
  def change
    add_reference :amenities, :amenity_category, foreign_key: true
    add_column :amenities, :is_property_level, :string
  end
end
