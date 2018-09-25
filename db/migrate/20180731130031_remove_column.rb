class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :properties, :address_line_1, :text
    remove_column :properties, :address_line_2, :text
  end
end
