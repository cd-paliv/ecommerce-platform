class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :size, optional: true
  belongs_to :color, optional: true
  has_many :sale_items
  has_many :sales, through: :sale_items

  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
end
