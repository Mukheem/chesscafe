class ChangeJsonbFieldName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :order, :orderplaced
  end
end
