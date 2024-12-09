class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /products or /products.json
  def index
    @pagy, @products = pagy(Product.all)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
    @sizes = Size.all
    @colors = Color.all
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all
    @sizes = Size.all
    @colors = Color.all
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @categories = Category.all
    @sizes = Size.all
    @colors = Color.all

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Producto creado correctamente" }
        format.json { render :show, status: :created, location: @product }
      else
        flash.now[:error] = @product.errors.full_messages.join(", ")
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        if params[:product][:images]
          @product.images.attach(params[:product][:images])
        end
        format.html { redirect_to @product, notice: "Producto actualizado correctamente" }
        format.json { render :show, status: :ok, location: @product }
      else
        flash.now[:error] = @product.errors.full_messages.join(", ")
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    if @product.update!(stock: 0, deleted_at: Time.now)
      flash[:notice] = "Producto eliminado correctamente"
    else
      flash[:error] = @product.errors.full_messages.join(", ")
    end

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :stock, :price, :size_id, :color_id, category_ids: [], images: [])
    end
end
