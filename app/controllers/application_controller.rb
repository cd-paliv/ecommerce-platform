class ApplicationController < ActionController::Base
  before_action :set_locale
  allow_browser versions: :modern
  helper_method :current_user, :current_sale

  include Pagy::Backend

  rescue_from CanCan::AccessDenied do |exception|
    handle_access_denied(exception)
  end

  rescue_from ActionController::RoutingError, with: :handle_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to sessions_new_path unless user_signed_in?
  end

  def current_sale
    Sale.find_or_create_by!(user: current_user, status: "pending") if current_user
  end

  def handle_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def handle_access_denied(exception)
      if user_signed_in?
        redirect_to root_path, alert: "No estás autorizado para acceder a esta página"
      else
        redirect_to sessions_new_path, alert: "Debes iniciar sesión para acceder a esta página"
      end
    end


    def record_not_found
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
end
