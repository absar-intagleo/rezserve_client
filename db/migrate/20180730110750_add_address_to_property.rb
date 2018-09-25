class AddAddressToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :address_line_1, :text
    add_column :properties, :address_line_2, :text
    add_column :properties, :latitude, :string
    add_column :properties, :longitude, :string
    add_column :properties, :facebook_link, :string
    add_column :properties, :skype_id, :string
    add_column :properties, :twitter_address, :string
  end
end
