class ItemsController < ApplicationController

	def new
		@items=Item.new
	end


	def getdata
		item_name_selected= params[:data_value]
		puts item_name_selected

		selected_values=Item.find_by item_name: item_name_selected
		puts selected_values.unit_price

		render json: selected_values
	end


end