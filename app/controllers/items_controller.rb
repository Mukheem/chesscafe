class ItemsController < ApplicationController

	def new
		@items=Item.new
	end


	def getdata
		item_name_selected= params[:data_value]
		
		selected_values=Item.find_by item_name: item_name_selected
		
		render json: selected_values
	end


end