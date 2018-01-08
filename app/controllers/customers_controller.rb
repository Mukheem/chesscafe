class CustomersController < ApplicationController

	def index
		@customers=Customer.all
	end

	def show
		@customer=Customer.find(params[:id])
		#@customer=Customer.find_by (phonenumber: '7744092494')
	end

	def new
		@customer=Customer.new
	end

	def create
			flag=0
			begin
				@customer=Customer.find_by_phonenumber(customer_params[:phonenumber])
				if  Customer.exists?(@customer.id)
					if flag==0
						flash[:success] = "Customer details found successfully." # :success :alert :warning :info
					else
						flash[:warning] = "Customer created. Kindly update the details."
					end
					redirect_to customer_path(@customer)
				end
			rescue
				cust=Customer.new(phonenumber: customer_params[:phonenumber])
				cust.save
				flag=1
				retry
			end			
	end

	def update
		@customer=Customer.find(params[:id])

		if @customer.update(customer_params)
			flash[:success] = "Customer details updated successfully."
			redirect_to new_order_path
		else
			flash[:warning] = "Error in updating details."
			redirect_to customer_path(@customer)
		end
	end

	private
		def customer_params
			params.require(:customer).permit(:phonenumber,:name,:email,:address,:gender)
		end

end