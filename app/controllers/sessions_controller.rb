 class SessionsController < ApplicationController
    def new; end
    def create
      facelook = Facelook.find_by(email: params[:email])
      # finds existing facelook, checks to see if user can be authenticated
      if facelook.present? && facelook.authenticate(params[:password])
      # sets up facelook.id sessions
        session[:facelook_id] = facelook.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
    def destroy
      # deletes facelook session
      session[:facelook_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
  end