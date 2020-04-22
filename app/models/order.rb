class Order < ApplicationRecord
  belongs_to :end_user
  has_many :ordered_items

  enum payment_method: { credit: 0, bunk: 1 }
  enum status: { a: 0, b: 1, c: 2, d: 3, e: 4 }
  
end
