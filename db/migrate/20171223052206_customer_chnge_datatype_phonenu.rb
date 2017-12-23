class CustomerChngeDatatypePhonenu < ActiveRecord::Migration[5.1]
  def change
  	change_column :customers, :phonenumber, :string
  end
end
