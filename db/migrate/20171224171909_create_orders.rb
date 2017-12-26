class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.text :ordertype
    	t.jsonb :order
    	t.float :totalprice
    	t.text :paymentmethod
    	t.timestamps
    end
  end
end
