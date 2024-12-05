class ImagesController < ApplicationController
  before_action :set_product

  def destroy
    @image = @product.images.find(params[:id])
    @image.purge
    redirect_to @product, notice: "Image was successfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
