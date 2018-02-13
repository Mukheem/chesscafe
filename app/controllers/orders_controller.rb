class OrdersController < ApplicationController

	def new
		@order=Order.new
	end
=begin
	def getdata
		item_name_selected= params[:"order[order_placed][][itemname]"]
		#puts item_name_selected
	end

	def show
		item_name_selected= params[:"order[order_placed][][itemname]"]
		#puts item_name_selected
	end
=end

	def index
		#@items=Item.all.order("created_at DESC")
		@orders=Order.all
	#	@products=Product.paginate(page: params[:page], per_page: 5)
	end

	def create
		@order=Order.new(order_params)
		@order.customer=$CUSTOMER_GLOBAL
		
		# Filters input records with all values. i.e., If any input record misses at least one value, this logic excludes it from being saved in DB
			#Local variable declarations
			actual_array = @order.order_placed
			flag=0
			filtered_array=Array.new
			 	 #Logic implementation
				 actual_array.each do |hash|
				    	hash.each do |key, value|
				    		if value.blank?
							  	flag=1
							  	break
							 end
						end	
						if flag==0
							filtered_array.push(hash)
						end		

						flag=0 #Reset falg value			
				 end	
			@order.order_placed = filtered_array
			
			if @order.save 
				flash[:success] = "Order saved successfully."
				#render 'new'
			else
				render 'new'
			end

		   
	end

	private
		def order_params
			params.require(:order).permit(:ordertype, :table_no, :discount_on_bill, :totalprice, :paymentmethod, order_placed: [:itemname, :quantity, :unitprice, :tax, :discount, :itemtotalprice])
			
		end

=begin
		def orderplaced_params
		  order_params[:orderplaced].to_h.map do |order_line_item|
		    order_line_item.each_with_object({}) do |(k,v), hsh|
		      hsh[k.gsub(":","")] = v["0"][]
		    end
		  end
		end

		def fixed_order_params
      		order_params.slice(:ordertype, :totalprice, :paymentmethod).merge!(orderplaced: orderplaced_params)
    	end
=end
	end