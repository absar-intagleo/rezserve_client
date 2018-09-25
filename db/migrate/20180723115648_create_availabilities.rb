class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.references :block, foreign_key: true
      t.text :availability_matrix

      t.timestamps
    end
  end
end
