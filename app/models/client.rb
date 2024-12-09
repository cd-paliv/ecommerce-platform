class Client < ApplicationRecord
  has_many :sales, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
