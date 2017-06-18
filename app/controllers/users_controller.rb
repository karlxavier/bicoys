class UsersController < ApplicationController

	def update
		respond_to do |format|
			@user = current_user
		    authy = Authy::API.register_user(
		        email: @user.email,
		        cellphone: params[:user][:mobile_no],
        		country_code: '+971'
		    )
		    @user.update(authy_id: authy.id, mobile_no: params[:user][:mobile_no])

      		Authy::API.request_sms(id: @user.authy_id)
			format.js
		end
	end

	def verify

	    # Use Authy to send the verification token
	    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

	    if token.ok?
	      # Mark the user as verified for get /user/:id
	      @user.update(verified: true)

	      # Send an SMS to the user 'success'
	      send_message("You did it! Signup complete :)")

	      # Show the user profile
	      redirect_to user_path(@user.id)
	    else
	      flash.now[:danger] = "Incorrect code, please try again"
	      render :show_verify
	    end
	end


	private

	def send_message(message)
	    @user = current_user
	    twilio_number = ENV['TWILIO_NUMBER']
	    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
	    message = @client.account.messages.create(
	      :from => twilio_number,
	      :to => @user.mobile_no,
	      :body => message
	    )
	    puts message.to
	end

end