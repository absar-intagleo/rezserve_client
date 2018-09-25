class CreateCancellationPolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :cancellation_policies do |t|
      t.string :plan
      t.string :penalty
      t.boolean :refundable
      t.references :block, foreign_key: true

      t.timestamps
    end
  end
end
