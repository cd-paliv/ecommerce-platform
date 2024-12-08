class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.deactivated
        flash.now[:alert] = "La cuenta se encuentra desactivada."
        respond_to do |format|
          format.html { render :new }
          format.turbo_stream { render :new }
        end
      elsif user&.authenticate(params[:password])
        session[:user_id] = user.id
        respond_to do |format|
          format.html { redirect_to root_path, notice: "Ingresaste correctamente." }
          format.turbo_stream { redirect_to root_path, notice: "Ingresaste correctamente." }
        end
      else
        flash.now[:alert] = "Email o contraseña incorrectos."
        respond_to do |format|
          format.html { render :new }
          format.turbo_stream { render :new }
        end
      end
    else
      flash.now[:alert] = "Email o contraseña incorrectos."
      respond_to do |format|
        format.html { render :new }
        format.turbo_stream { render :new }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Cerraste sesión correctamente."
  end
end
