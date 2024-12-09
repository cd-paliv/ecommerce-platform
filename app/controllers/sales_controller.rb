class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update checkout cancel ]

  # GET /sales or /sales.json
  def index
    @sales = Sale.order(updated_at: :desc).all
  end

  # GET /sales/1 or /sales/1.json
  def show
  end

  # GET /sales/1/edit
  def edit
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: "Venta actualizada." }
        format.json { render :show, status: :ok, location: @sale }
      else
        flash.now[:error] = @sale.errors.full_messages.join(", ")
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /sales/1/checkout
  def checkout
    if @sale.sale_items.empty?
      redirect_to @sale, alert: "El carrito no tiene productos."
      return
    end

    client = Client.find_or_initialize_by(email: params[:client][:email])
    client.update(client_params)

    @sale.update!(status: "completed", client: client)

    redirect_to @sale, notice: "Venta completada."

    new_sale = Sale.create!(user: current_user)
    session[:sale_id] = new_sale.id
  end

  # PATCH /sales/1/cancel
  def cancel
    @sale.update!(status: "canceled")

    redirect_to @sale, notice: "Venta cancelada."
  end

  private
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(sale_items_attributes: [ :id, :product_id, :quantity, :price, :_destroy ])
    end

    def client_params
      params.require(:client).permit(:name, :email, :phone)
    end
end
