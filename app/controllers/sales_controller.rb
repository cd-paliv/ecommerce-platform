class SalesController < ApplicationController
  before_action :set_sale, only: %i[ index show edit update checkout cancel ]

  # GET /sales or /sales.json
  def index
    @sales = Sale.all
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
        format.html { redirect_to @sale, notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /sales/1/checkout
  def checkout
    @sale.update!(status: "completed")
    redirect_to @sale, notice: "Sale was successfully completed."

    new_sale = Sale.create!(user: current_user)
    session[:sale_id] = new_sale.id
  end

  # PATCH /sales/1/cancel
  def cancel
    @sale.update!(status: "canceled")
    redirect_to @sale, notice: "Sale was successfully canceled."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(sale_items_attributes: [ :id, :product_id, :quantity, :price, :_destroy ])
    end
end
