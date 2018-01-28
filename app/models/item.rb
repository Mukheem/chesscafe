class Item < ApplicationRecord

	validates :item_name, presence: true
	validates :item_id, presence: true, uniqueness: true
	validates :unit_price, presence: true
	validates :tax, presence: true
	validates :discount, presence: true
	default_scope -> {order(updated_at: :desc)}
end