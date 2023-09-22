  class PasswordsController < ApplicationController
    # allows only logged in facelooks
    before_action :require_facelook_logged_in!
    def edit; end
    def update
      # update facelook password
      if Current.facelook.update(password_params)
        redirect_to root_path, notice: 'Password Updated'
      else
        render :edit
      end
    end
    private
    def password_params
      params.require(:facelook).permit(:password, :password_confirmation)
    end
  end