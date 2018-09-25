class AddCurrencyToProperty < ActiveRecord::Migration[5.2]
  def change
    add_reference :properties, :currency, foreign_key: true
    add_reference :properties, :time_zone, foreign_key: true
  end
end
