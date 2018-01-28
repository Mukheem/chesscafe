class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
    	t.string :product_code
    	t.string :product_name
    	t.string :category
    	t.text :description
    	t.string :tax_name
    	t.string :tax_type
    	t.integer :tax
    	t.integer :cess
    	t.integer :quantity
    	t.integer :purchase_price
    	t.integer :sale_price
    	t.integer :products_remaining
    	t.integer :products_sold
    	t.timestamps
    end
  end
end
