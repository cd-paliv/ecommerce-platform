class Product < ApplicationRecord
  acts_as_paranoid
  has_and_belongs_to_many :categories
  belongs_to :size, optional: true
  belongs_to :color, optional: true
  has_many :sale_items
  has_many :sales, through: :sale_items

  has_many_attached :images

  validates :name, :price, :stock, :images, presence: true

  def can_sell?(quantity)
    self.stock >= quantity
  end

  def sell(quantity)
    self.update!(stock: self.stock - quantity)
  end

  def restock(quantity)
    self.update!(stock: self.stock + quantity)
  end
end
