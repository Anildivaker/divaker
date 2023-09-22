 class ApplicationController < ActionController::Base
    before_action :set_current_facelook
    def set_current_facelook
      # finds user with session data and stores it if present
      Current.facelook = Facelook.find_by(id: session[:facelook_id]) if session[:facelook_id]
    end
    def require_facelook_logged_in!
      # allows only logged in facelook
      redirect_to sign_in_path, alert: 'You must be signed in' if Current.facelook.nil?
    end
  end