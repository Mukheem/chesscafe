class ItemsController < ApplicationController

	def new
		@item=Item.new
	end


	def create
		@item=Item.new(item_params)
		if @item.save
			flash[:success]="Menu Item saved successfully"
			redirect_to items_path
		else
			render 'new'
		end
	end

	def show
		@item=Item.find(params[:id])
	end

	def edit
		@item=Item.find(params[:id])
	end

	def update
		@item=Item.find(params[:id])
		if @item.update(item_params)
			flash[:notice]="Menu Item Updated"
			redirect_to items_path
		else
			render 'edit'
		end

	end

	def index
		@items=Item.all.order("created_at DESC")
	end

	def destroy
		Item.find(params[:id]).destroy
		flash[:notice]="Menu Item Deleted"
		redirect_to items_path
	end

	#gets untprice,discount and other fields for specific selected item
	def getdata
		item_name_selected= params[:data_value]
		selected_values=Item.find_by item_name: item_name_selected
		render json: selected_values
	end

	def getList
		items_list=Item.pluck(:item_name)
		render json: items_list
	end

	private
	def item_params
		params.require(:item).permit(:item_name,:item_id,:unit_price,:tax,:discount)
	end

end