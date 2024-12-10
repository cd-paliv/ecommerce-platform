require "bcrypt"

class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users or /users.json
  def index
    @pagy, @users = pagy(User.all)
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Usuario creado exitosamente." }
        format.json { render :show, status: :created, location: @user }
      else
        flash.now[:error] = @user.errors.full_messages.join(", ")
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Usuario actualizado correctamente." }
        format.json { render :show, status: :ok, location: @user }
      else
        flash.now[:error] = @user.errors.full_messages.join(", ")
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /users/1/deactivate
  def deactivate
    @user.update(deactivated: true, password_digest: BCrypt::Password.create(SecureRandom.hex))
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "Usuario desactivado exitosamente." }
        format.json { render :show, status: :ok, location: @user }
      else
        flash.now[:error] = @user.errors.full_messages.join(", ")
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :name, :password, :password_confirmation, :phone, :role)
    end
end
