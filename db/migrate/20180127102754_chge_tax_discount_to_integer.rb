class ChgeTaxDiscountToInteger < ActiveRecord::Migration[5.1]
  def change
  	change_column :items, :tax, :integer
  	change_column :items, :discount, :integer
  end
end
