class Order < ApplicationRecord
  belongs_to :end_user
  has_many :ordered_items
end
