class Users::RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    if resource.encrypted_password.blank? # || params[:password].blank?
      resource.email = params[:email] if params[:email]
      if !params[:password].blank? && params[:password] == params[:password_confirmation]
        logger.info "Updating password"
        resource.password = params[:password]
        resource.save
      end
      if resource.valid?
        resource.update_without_password(params)
      end
    else
      resource.update_with_password(params)
    end
  end

  def create
    super
    
    if current_user
      user_address = current_location
      user_address.update_attribute(:user_id, current_user.id)
    end
  end

end
