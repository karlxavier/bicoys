class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :current_order
  helper_method :current_location

  def current_order
    if !session[:order_id].nil? && !session[:restaurant_id].nil?      
      Order.user_orders(session[:order_id],session[:restaurant_id]).first || Order.new
    else
      Order.new
    end
  end

  def current_location
    if session[:user_address_id].nil?
        if user_signed_in?
            if current_user.user_addresses.present?
              current_user.user_addresses.first
            else
              UserAddress.new
            end
        else
            UserAddress.where(id: session[:user_address_id]).first || UserAddress.new
        end
    else
        UserAddress.where(id: session[:user_address_id]).first || UserAddress.new
    end
  end

  # def after_sign_in_path_for(resource)
    # sign_in_url = new_user_session_url
    # if request.referer == sign_in_url
    #   super
    # else
    #   stored_location_for(resource) || request.referer || root_path
    # end

    # sign_in_url = new_user_session_url
    # if request.referer == sign_in_url || request.referer.include?("google")
    #   super
    #   root_path
    # else
    #   stored_location_for(resource) || request.referer || root_path
    # end 
  # end

  def render_404
    render :template => "errors/err_404", :status => 404
  end

  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :fullname, :mobile_no, :restaurant_id, :image_url, :provider, :uid) }
	  end
end
