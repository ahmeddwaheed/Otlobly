class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  before_create :set_order_item_status
  after_save :update_order

  private
  def set_order_item_status
    self.quantity = 1
  end

  def update_order
  	Order.find(self.order_id).save
  end

end
