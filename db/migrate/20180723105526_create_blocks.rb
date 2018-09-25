class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.string :name
      t.references :block_type, foreign_key: true
      t.references :residential_property, foreign_key: true
      t.float :rate

      t.timestamps
    end
  end
end
