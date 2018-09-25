class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|
      t.integer :minimum_age_limt
      t.string :check_in_time
      t.string :check_out_time
      t.string :age_category
      t.integer :adult_age_limit
      t.integer :infant_age_limit
      t.string :smoking_policy
      t.text :special_instruction
      t.string :booking_cancellation_period
      t.text :booking_cancellation_policy
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
