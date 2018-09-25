class RenameColumns < ActiveRecord::Migration[5.2]
  def change
  	rename_column :properties, :facebook_link, :facebook_address
    rename_column :properties, :skype_id, :skype_address
  end
end
