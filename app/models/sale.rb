class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  accepts_nested_attributes_for :sale_items

  before_save :calculate_total
  after_update :handle_cancellation, if: :is_cancelled?

  private

  def calculate_total
    self.total = sale_items.each.sum { |si| si.price * si.quantity }
  end

  def handle_cancellation
    ## restock products
  end
end
