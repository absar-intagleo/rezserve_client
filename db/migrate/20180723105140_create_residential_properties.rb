class CreateResidentialProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :residential_properties do |t|
      t.string :website
      t.references :property, foreign_key: true
      t.references :hotel_chain, foreign_key: true
      t.references :star_rating, foreign_key: true
      t.references :rating_source, foreign_key: true

      t.timestamps
    end
  end
end
