class CreateAdditionalBeds < ActiveRecord::Migration[5.2]
  def change
    create_table :additional_beds do |t|
      t.integer :bed_quantity
      t.float :bed_charges
      t.string :bed_charges_unit
      t.references :block, foreign_key: true
      t.references :bed_type, foreign_key: true

      t.timestamps
    end
  end
end
