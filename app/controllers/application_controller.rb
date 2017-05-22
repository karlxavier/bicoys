class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :current_order
  helper_method :current_location

  def current_order
    if !session[:order_id].nil? && !session[:restaurant_id].nil?      
      if Order.exists?(id: session[:order_id], restaurant_id: session[:restaurant_id], order_status_id: 1)
        Order.where(id: session[:order_id], restaurant_id: session[:restaurant_id]).first                
      else
        Order.new
      end
    else
      Order.new
    end
  end

  def current_location
    if session[:user_address_id].nil?
        if user_signed_in?
            if current_user.user_addresses.present?
              puts '**********USER ADD PRESENT**********'
              current_user.user_addresses.first
            else
              puts '**********ADD NOT PRESENT**********'
              UserAddress.new
            end
        else
            if UserAddress.exists?(id: session[:user_address_id])
                UserAddress.where(id: session[:user_address_id]).first
                # session[:user_address_id] = nil
            else
                # session[:user_address_id] = nil
                UserAddress.new
            end
        end
    else
        if UserAddress.exists?(id: session[:user_address_id])
            UserAddress.where(id: session[:user_address_id]).first
        else
            UserAddress.new
        end
    end
  end

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end


  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :fullname, :mobile_no, :restaurant_id, :image_url, :provider, :uid) }
	  end
end
