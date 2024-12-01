class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update checkout cancel ]

  # GET /sales or /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1 or /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @sale.sale_items.build
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)
    @sale.user = current_user

    @sale.sale_items.each do |si|
      product = Product.find(si.product_id)
      si.price = product.price
    end

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: "Sale was successfully created." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
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
