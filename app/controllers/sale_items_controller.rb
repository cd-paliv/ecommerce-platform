class SaleItemsController < ApplicationController
  def create
    @sale_item = current_sale.sale_items.new(sale_item_params)
    if @sale_item.save
      redirect_to products_path, notice: "Product added to cart"
    else
      redirect_to products_path, alert: "Unable to add product to cart"
    end
  end

  def destroy
    @sale_item = SaleItem.find(params[:id])
    @sale = @sale_item.sale
    @sale_item.destroy

    redirect_to @sale, notice: "Item removed successfully."
  end

  private

  def sale_item_params
    params.require(:sale_item).permit(:product_id, :quantity, :price)
  end
end
