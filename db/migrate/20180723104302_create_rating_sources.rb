class CreateRatingSources < ActiveRecord::Migration[5.2]
  def change
    create_table :rating_sources do |t|
      t.string :name

      t.timestamps
    end
  end
end
