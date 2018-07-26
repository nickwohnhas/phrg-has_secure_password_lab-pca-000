# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id if @user.authenticate(params[:user][:password])
    redirect_to(controller: "users", action: "new")
  end
end
