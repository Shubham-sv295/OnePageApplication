class UsersController < ApplicationController
  def new
  	@user= User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		UserMailer.with(user: @user).user_varification.deliver
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def confirm_email
  	byebug
  	@user = User.find_by(confirm_token: params[:id])
  	if @user
  	  @user.email_activate
  	  redirect_to create_session_path(request.parameters.merge(email: @user.email, password: @user.password))
  	else
  		redirect_to root_path
  	end
  end

  def forget_password_mail
    @user = User.find_by_email(params[:email])
    if @user
      UserMailer.with(user: @user).forget_password_instructions.deliver
      render :js => "alert('Instructions sent to ur mail');"
    else
      render :js => "alert('User not found');"
    end
  end
  
  def forget_password
    byebug
    @user = User.find_by_id(params[:id])
  end

  def update_password
    @user = User.find_by_id(params[:id])
    byebug
    if @user.update(user_params)
      redirect_to new_session_path, :js => "alert('Password Updated Successfully');"
    else
      render :forget_password
    end
  end
    
  def destroy
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :mobile_number, :password, :password_confirmation)
  end
end

