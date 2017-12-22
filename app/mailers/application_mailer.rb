class ApplicationMailer < ActionMailer::Base
  default from: 'noreply.takeout@gmail.com'
  layout 'mailer'

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to takeout.ph')
  end
end
