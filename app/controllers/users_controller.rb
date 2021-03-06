class UsersController < ApplicationController
	before_action :check_user_verification, only: [:user_verify_mobile]

	def update
		@user = current_user
		mobile_no = params[:user][:area_code] + params[:user][:mobile_no]
		if valid?(mobile_no)
			puts '****** valid mobile ******'
			respond_to do |format|
			    authy = Authy::API.register_user(
			        email: @user.email,
			        cellphone: mobile_no,
			        country_code: params[:user][:area_code]
			    )
			    @user.update(authy_id: authy.id, mobile_no: params[:user][:mobile_no], area_code: params[:user][:area_code])

	      		Authy::API.request_sms(id: @user.authy_id)
				format.js
			end
		else
			puts '****** not valid mobile no ********'
		end
	end

	def verify
		respond_to do |format|
			@user = current_user
		    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

		    if token.ok?
		      # Mark the user as verified for get /user/:id
		      @user.update(verified: true)
		      # redirect_to checkout_path

		      # send_message("You did it! Signup complete :)")
		      puts '********* CHECKOUT ***********'
		      render :js => "window.location = '/checkout'"

		    else
		      flash.now[:danger] = "Incorrect code, please try again"
		      render :show_verify
		    end

		    format.js
		end
	end

	def my_orders
		@orders = Order.user_finish_orders(current_user.id).all
		# @orders = current_user.orders.all
	end
 
	def user_verify_mobile
	end

	def complains
		respond_to do |format|
			@order = Order.find(params[:order_id])
			format.js
		end
	end

	private

	def send_message(message)
	    @user = current_user
	    twilio_number = ENV['TWILIO_NUMBER']
	    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
	    message = @client.account.messages.create(
	      :from => twilio_number,
	      :to => @user.mobile_no,
	      :body => message
	    )
	    puts message.to
	end

	def valid?(phone_number)
		lookup_client = Twilio::REST::LookupsClient.new(ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"])
		begin
		    	response = lookup_client.phone_numbers.get(phone_number)
		    	response.phone_number #if invalid, throws an exception. If valid, no problems.
		    return true
		rescue => e
		    if e.code == 20404
		    	return false
		    else
		    	raise e
		    end
		end
	end

	def check_user_verification
		if current_user.verified?
			puts '******** VERIFIED ***********'
			redirect_to checkout_path
		end
	end

end


