class SessionsController < ApplicationController
    def new
      # Show login form
    end
  
    def create
      if params[:username] == "superadmin" && params[:password] == "password25"
        session[:username] = "superadmin"
        session[:password] = "password25"
        flash[:notice] = "Logged in successfully."
        redirect_to users_path
      else
        flash[:alert] = "Invalid credentials."
        render :new
      end
    end
  
    def destroy
      session[:username] = nil
      session[:password] = nil
      flash[:notice] = "Logged out."
      redirect_to root_path
    end
  end
  