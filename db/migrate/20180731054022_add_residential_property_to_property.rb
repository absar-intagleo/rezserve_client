class AddResidentialPropertyToProperty < ActiveRecord::Migration[5.2]
  def change
    add_reference :properties, :residential_property, foreign_key: true
    remove_reference :residential_properties, :property, foreign_key: true
  end
end
