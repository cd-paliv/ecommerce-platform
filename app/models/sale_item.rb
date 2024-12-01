class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :quantity_available

  def subtotal
    quantity * price
  end

  private

  def quantity_available
    quantity > product.stock ? errors.add(:quantity, "is greater than available stock") : true
  end
end
