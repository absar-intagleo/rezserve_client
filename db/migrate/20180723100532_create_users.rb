class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :dt_uuid
      t.string :email
      t.integer :account_status
      t.references :user_type, foreign_key: true

      t.timestamps
    end
  end
end
