class CreateStock < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
    	t.string :item_name
    	t.string :item_id
    	t.float :unit_price
    	t.float :tax
    	t.float :discount
    	t.timestamps
    end
  end
end
