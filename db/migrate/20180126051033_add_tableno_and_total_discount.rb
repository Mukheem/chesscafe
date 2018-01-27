class AddTablenoAndTotalDiscount < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :table_no, :integer
  	add_column :orders, :discount_on_bill, :integer
  end
end
