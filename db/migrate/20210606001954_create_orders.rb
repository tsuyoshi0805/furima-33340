class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      
      t.timestamps
      
      t.integer :user_id,            null: false,foreign_key: true
      t.integer :item_id,            null: false,foreign_key: true
    
    end
  end
end
