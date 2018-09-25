class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.string :name
      t.float :fee_percentage
      t.string :fee_duration_unit
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
