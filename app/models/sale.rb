class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  accepts_nested_attributes_for :sale_items

  before_save :calculate_total
  after_update :handle_cancellation, if: :is_canceled?

  def is_canceled?
    self.is_canceled
  end

  def total
    sale_items.to_a.sum { |si| si.price * si.quantity }
  end

  private

  def calculate_total
    self.total = sale_items.to_a.sum { |si| si.price * si.quantity }
  end

  def handle_cancellation
    ## restock products
  end
end
