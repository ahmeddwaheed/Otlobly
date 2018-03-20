class Menu < ApplicationRecord
  belongs_to :restaurant
  validates :title, presence: true
  has_many :items
end
