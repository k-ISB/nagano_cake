class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :shipping_address
      t.string :direction
      t.string :postal_code
      t.integer :postage
      t.integer :payment
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
  end
end
