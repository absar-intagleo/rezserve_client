class AddCountryToProperty < ActiveRecord::Migration[5.2]
  def change
    # remove_reference :properties, :country, foreign_key: true
  end
end
