class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.product.price) : 0 }.sum
  end
private
  def set_order_status
    self.status = "Pending"
  end

  def update_subtotal
    self[:total] = total
  end
end
