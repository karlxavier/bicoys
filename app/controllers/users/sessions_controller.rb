class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super

    user_address = current_location
    user_address.update_attribute(:user_id, current_user.id)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])


  # end

  # def create
  #   if request.env['omniauth.auth']
  #     user = User.create_with_omniauth(request.env['omniauth.auth'])
  #     session[:user_id] = user.id    
  #     redirect_to user_path(user.id)
  #   else
  #     user = User.find_by_email(params[:email])
  #     user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to user_path(user.id)
  #   end
  # end

end
