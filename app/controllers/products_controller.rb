class ProductsController < ApplicationController

	def new
		@product=Product.new
	end

	def create
		@product=Product.new(product_params)
		if @product.save
			flash[:success]="Product "+@product.product_name+" saved successfully"
			redirect_to products_path
		else
			render 'new'
		end
	end

	def index
		#@items=Item.all.order("created_at DESC")
		@products=Product.paginate(page: params[:page], per_page: 5)
	end

	def edit
		@product=Product.find(params[:id])
	end
	def update
		@product=Product.find(params[:id])
		if @product.update(product_params)
			flash[:success]="Product "+@product.product_name+" updated successfully"
			redirect_to products_path
		else
			render 'edit'
		end
	end

	def destroy
		@product=Product.find(params[:id])
		@product.destroy
		flash[:notice]="Menu Item "+@product.product_name+" Deleted"
		redirect_to products_path
	end


	private 
	def product_params
		params.require(:product).permit(:product_code, :product_name, :category, :description, :tax_name, :tax_type, :tax, :cess, :quantity, :purchase_price, :sale_price, :products_remaining, :products_sold)
	end

end