class RegistrationsController < ApplicationController

	# instantiates new user
    def new
      @facelook = Facelook.new
    end
    def create
      @facelook = Facelook.new(facelook_params)
      if @facelook.save
      # stores saved user id in a session
        session[:facelook_id] = @facelook.id
        redirect_to root_path, notice: 'Successfully created account'
      else
        render :new
      end
    end
    private
    def facelook_params
      # strong parameters
      params.require(:facelook).permit(:email, :password, :password_confirmation)
    end

end
