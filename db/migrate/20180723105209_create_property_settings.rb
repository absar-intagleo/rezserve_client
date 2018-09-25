class CreatePropertySettings < ActiveRecord::Migration[5.2]
  def change
    create_table :property_settings do |t|
      t.integer :minimum_age_limit
      t.string :check_in_time
      t.string :check_out_time
      t.string :age_category
      t.integer :adult_age_limit
      t.integer :infant_age_limit
      t.string :smoking_policy
      t.references :residential_property, foreign_key: true

      t.timestamps
    end
  end
end
