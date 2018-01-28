class Product < ApplicationRecord

	validates :product_code, presence: true
	validates :product_name, presence: true
	validates :quantity, presence: true
	validates :purchase_price, presence: true
	validates :sale_price, presence: true
	validates :products_remaining, presence: true
	validates :products_sold, presence: true
	default_scope -> {order(updated_at: :desc)}

end