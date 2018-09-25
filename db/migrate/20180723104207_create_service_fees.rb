class CreateServiceFees < ActiveRecord::Migration[5.2]
  def change
    create_table :service_fees do |t|
      t.string :name
      t.integer :type
      t.float :fee
      t.string :duration_unit
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
