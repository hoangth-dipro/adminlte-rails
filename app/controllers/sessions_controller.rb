class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: %i[create new]
  layout 'empty'

  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      sign_in(user)
      redirect_back_or root_path
    else
      flash[:error] = "Email/Password invalid"
      redirect_to sign_in_path
    end
  end

  def destroy
    logout
    redirect_to sign_in_path
  end
end
