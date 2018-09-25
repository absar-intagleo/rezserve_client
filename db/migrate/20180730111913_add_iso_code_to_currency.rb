class AddIsoCodeToCurrency < ActiveRecord::Migration[5.2]
  def change
    add_column :currencies, :iso_code, :string
  end
end
