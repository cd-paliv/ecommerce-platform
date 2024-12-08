class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  accepts_nested_attributes_for :sale_items

  before_save :calculate_total
  after_update :handle_cancelation, if: :canceled?
  after_update :handle_checkout, if: :completed?

  STATUS = %w[pending completed canceled].freeze

  def pending?
    self.status == "pending"
  end

  def canceled?
    self.status == "canceled"
  end

  def completed?
    self.status == "completed"
  end

  def total
    self.sale_items.to_a.sum { |si| si.price * si.quantity }
  end

  def total_quantity
    self.sale_items.to_a.sum { |si| si.quantity }
  end

  private

  def calculate_total
    self.total = sale_items.to_a.sum { |si| si.price * si.quantity }
  end

  def handle_checkout
    self.sale_items.each do |sale_item|
      sale_item.product.sell(sale_item.quantity)
    end
  end

  def handle_cancelation
    self.sale_items.each do |sale_item|
      sale_item.product.restock(sale_item.quantity)
    end
  end
end
