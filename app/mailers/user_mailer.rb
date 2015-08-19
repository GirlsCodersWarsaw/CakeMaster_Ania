class UserMailer < ApplicationMailer
  default from: 'czarrrna@gmail.com'

  def welcome_email(user_id)
    @user = User.find(user_id)
    @url  = 'www.google.com'
    mail(to: @user.email, subject: 'Welcome to CakeMaster')
  end

end
