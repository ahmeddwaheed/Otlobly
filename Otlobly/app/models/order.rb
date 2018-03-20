class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.item.price) : 0 }.sum
  end
private
  def set_order_status
    self.status = "Pending"
    self.total = 0.0
  end

  def update_subtotal
    self[:total] = subtotal
  end
end
