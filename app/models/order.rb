class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders
  enum status: ["ordered", "paid", "cancelled", "completed"]


end