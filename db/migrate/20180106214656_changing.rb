class Changing < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :orderplaced, :order_placed
  end
end
