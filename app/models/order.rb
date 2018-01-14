class Order < ApplicationRecord

belongs_to :customer
 #serialize :orderplaced
 serialize(:order_placed, Array)
#accepts_nested_attributes_for :order
store_accessor :order_placed, :itemname, :quantity, :unitprice, :tax, :discount, :itemtotalprice

	ORDER_TYPE_LIST = ["Order","Take-Away","Home Delivery"]
	PAYMENT_METHOD_LIST = ["Cash","Card","Wallet"]

end