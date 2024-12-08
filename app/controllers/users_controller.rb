class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy deactivate ]
  load_and_authorize_resource

  # GET /users or /users.json
  def index
    @users = User.all
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
        format.html { redirect_to @user, notice: "User was successfully created." }
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
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        flash.now[:error] = @user.errors.full_messages.join(", ")
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PATCH /users/1/deactivate
  def deactivate
    if @user.admin?
      respond_to do |format|
        format.html { redirect_to users_path, alert: "Admin user cannot be deactivated." }
        format.json { render json: { error: "Admin user cannot be deactivated." }, status: :unprocessable_entity }
      end
    else
      @user.update(deactivated: true, password_digest: SecureRandom.hex)
      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: "User was successfully deactivated." }
          format.json { render :show, status: :ok, location: @user }
        else
          flash.now[:error] = @user.errors.full_messages.join(", ")
          format.html { render :index, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :name, :password, :password_confirmation, :phone, :role)
    end
end
