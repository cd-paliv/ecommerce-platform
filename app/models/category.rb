class Category < ApplicationRecord
    has_and_belongs_to_many :products

    validates :name, :category_type, presence: true

    scope :clothing, -> { where(category_type: "clothing") }
    scope :seasons, -> { where(category_type: "seasons") }
    scope :gender, -> { where(category_type: "gender") }

    def display_name
        "#{name} | #{category_type}"
    end
end
