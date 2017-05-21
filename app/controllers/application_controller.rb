class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :current_order

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
