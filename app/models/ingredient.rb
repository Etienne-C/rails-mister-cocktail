class Ingredient < ApplicationRecord

  INGREDIENTS = %w(lemon salt vodka)
  validates :name, uniqueness: true, presence: true
  has_many :doses
end
