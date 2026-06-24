class Admin::SessionsController < ApplicationController
  before_action :redirect_if_already_signed_in, only: [ :new, :create ]

  def new
  end

  def create
    if params[:password] == ENV["ADMIN_PASSWORD"]
      session[:admin] = true
      redirect_to new_admin_match_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Wrong credentials!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete :admin
    redirect_to matches_path, notice: "Logged out!"
  end

  private

  def redirect_if_already_signed_in
    redirect_to new_admin_match_path, notice: "You are already signed in!" if admin_signed_in?
  end
end
