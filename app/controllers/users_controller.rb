class UsersController < ApplicationController

  def new; end

  def create
    # binding.pry
    user = User.create(name: params[:user][:name], password: params[:user][:password])
    # binding.pry
    if params[:user][:password] == params[:user][:password_confirmation]
      session[:user_id] = user.id
    end
    redirect_to(controller: 'users', action: 'new')
  end

end
