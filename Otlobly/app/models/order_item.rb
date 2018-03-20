class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  before_create :set_order_item_status

  private
  def set_order_item_status
    self.quantity = 1
  end

end
