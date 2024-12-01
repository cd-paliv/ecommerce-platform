class ApplicationController < ActionController::Base
  before_action :set_locale
  allow_browser versions: :modern
  helper_method :current_user, :current_sale

  rescue_from CanCan::AccessDenied do |exception|
    handle_access_denied(exception)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

  def current_sale
    current_user ? sale = Sale.find_or_create_by(user: current_user, status: "pending") : sale = Sale.find_or_create_by(session_id: session.id, status: "pending")
    sale
  end

  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def handle_access_denied(exception)
      if user_signed_in?
        redirect_to root_path, alert: "You are not authorized to access this page - " + exception.message
      else
        redirect_to new_session_path, alert: "You need to log in before continuing."
      end
    end
end
