class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :current_order
  helper_method :current_location
  helper_method :admins_current_orders
  helper_method :restos_current_orders

  def current_order
    if !session[:order_id].nil? && !session[:restaurant_id].nil?      
      Order.user_current_orders(session[:order_id],session[:restaurant_id]).first || Order.new
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

  def admins_current_orders
    @current_orders = Order.where(order_status_id: 2)
  end

  def restos_current_orders
    current_resto_orders = Order.where(order_status_id: 3, restaurant_id: current_resto.restaurant_id)
  end

  def render_404
    render :template => "errors/err_404", :status => 404
  end

  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :fullname, :mobile_no, :restaurant_id, :image_url, :provider, :uid) }
	  end
end
