class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
