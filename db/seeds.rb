# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#create{:item_name => "Sample", :item_id => "001", :unit_price => "1", :tax => "0", :discount => "0"}
require 'open-uri'
		Item.create(:item_name => "Sample", :item_id => "001", :unit_price => "1", :tax => "0", :discount => "0")
