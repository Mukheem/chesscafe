class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
    	t.text :name
    	t.integer :phonenumber
    	t.string :email
    	t.string :address
    	t.text :gender
    	t.text :created_by
    	t.timestamps
    end
  end
end
