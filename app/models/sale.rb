class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  accepts_nested_attributes_for :sale_items

  before_save :calculate_total
  after_update :handle_cancelation, if: :is_canceled?

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

  def handle_cancelation
    ## restock products
  end
end
