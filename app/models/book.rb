class Book < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :restrict_with_error

  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }

  def in_stock?
    stock > 0
  end
end
