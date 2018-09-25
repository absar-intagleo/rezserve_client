class AddOffsetToTimeZone < ActiveRecord::Migration[5.2]
  def change
    add_column :time_zones, :utc_offset, :integer
  end
end
