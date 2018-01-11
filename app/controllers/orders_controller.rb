class OrdersController < ApplicationController

	def new
		@order=Order.new
	end

	def create
		#puts params

		@order=Order.new(order_params)
		@order.customer=Customer.first
		@order.save

		# puts @order.order_placed
		 arra = @order.order_placed
		 flag=0
		 array=Array.new
		 puts "Actual Array"
		 puts arra
		 puts "====================="
		 arra.each do |hash|
		 	puts "Hash is"
		 	puts  hash
		 	  # puts "#{hash[:itemname]} #{hash[:quantity]} #{hash[:unitprice]} #{hash[:tax]} #{hash[:discount]} #{hash[:itemtotalprice]}"
		    	hash.each do |key, value|
		    		puts value
					 if value.blank?
					  	flag=1
					 end
				end	


				if flag==0
					array.push(hash)
				end
				if flag==1
					puts "------------------Nothing-------------------"
					flag=0
				end
				puts "End of first Hash--"
		    end	

		   puts array	
		   
	end

	private
		def order_params
			#params.require(:order).permit(:ordertype, :totalprice, :paymentmethod, {orderplaced: [itemname: [""], quantity: [], unitprice: [], tax: [], discount: [], itemtotalprice: [] ]})
			#params.require(:order).permit(:ordertype, :totalprice, :paymentmethod, :itemname, :orderplaced => [ { itemname: [], quantity: [], unitprice: [], tax: [], discount: [], itemtotalprice: [] }])
			#params.require(:order).permit(:ordertype, :totalprice, :paymentmethod, {orderplaced: {"itemname": ["0"], "quantity": ["0"], "unitprice": ["0"], "tax": ["0"], "discount": ["0"], "itemtotalprice": ["0"]}})
			#params.require(:order).permit!
			#params.require(:order).permit(:ordertype, :totalprice, :paymentmethod, orderplaced: ["itemname": ["0"], "quantity": ["0"], "unitprice": ["0"], "tax": ["0"], "discount": ["0"], "itemtotalprice": ["0"]])
			#params[:order][:order_placed] ||= []
			params.require(:order).permit(:ordertype, :totalprice, :paymentmethod, order_placed: [:itemname, :quantity, :unitprice, :tax, :discount, :itemtotalprice])
			
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