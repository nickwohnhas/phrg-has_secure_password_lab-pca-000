# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    a = { name: params[:user][:name],
          password: params[:user][:password] }
    user = User.create(a)
    param_check(user)
    redirect_to(controller: "users", action: "new")
  end

  def param_check(user)
    param_pass = params[:user][:password]
    param_confo = params[:user][:password_confirmation]
    return unless param_pass == param_confo
    session[:user_id] = user.id
  end
end
