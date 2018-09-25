class AddAmenitableToPropertyAmenity < ActiveRecord::Migration[5.2]
  def change
    add_reference :property_amenities, :ameniable, polymorphic: true, index: true
  end
end
