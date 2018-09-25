class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contract_signed, :boolean, dafault: false
  end
end
