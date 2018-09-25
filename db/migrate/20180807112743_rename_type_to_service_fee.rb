class RenameTypeToServiceFee < ActiveRecord::Migration[5.2]
  def change
  	rename_column :service_fees, :type, :service_type
  end
end
