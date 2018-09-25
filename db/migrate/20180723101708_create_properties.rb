class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.references :property_type, foreign_key: true
      t.text :address
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :contract_signer
      t.string :designation
      t.text :special_instructions
      t.string :booking_cancellation_period
      t.text :booking_cancellation_policy
      t.references :user, foreign_key: true
      # t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
