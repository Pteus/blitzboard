class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    if params[:password] == ENV["ADMIN_PASSWORD"]
      session[:admin] = true
      redirect_to admin_teams_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Wrong credentials!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete :admin
    redirect_to matches_path, notice: "Logged out!"
  end
end
