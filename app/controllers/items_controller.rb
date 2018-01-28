class ItemsController < ApplicationController

	def new
		@item=Item.new
	end


	def create
		@item=Item.new(item_params)
		if @item.save
			flash[:success]="Menu Item "+@item.item_name+" saved successfully"
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
			flash[:notice]="Menu Item "+@item.item_name+" updated successfully"
			redirect_to items_path
		else
			render 'edit'
		end

	end

	def index
		#@items=Item.all.order("created_at DESC")
		@items=Item.paginate(page: params[:page], per_page: 5)
	end

	def destroy
		@item=Item.find(params[:id])
		@item.destroy
		flash[:notice]="Menu Item "+@item.item_name+" Deleted"
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