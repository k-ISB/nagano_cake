class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.string :end_user_id
      t.string :item_id
      t.string :amount

      t.timestamps
    end
  end
end
