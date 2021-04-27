class UserMailer < ApplicationMailer
	def user_varification
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome Mail')
  end

  def forget_password_instructions
    @user = params[:user]
    mail(to: @user.email, subject: 'Forget password Mail')
  end
end
