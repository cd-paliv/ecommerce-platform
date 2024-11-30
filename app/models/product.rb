class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :size
  has_many :color

  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
end
