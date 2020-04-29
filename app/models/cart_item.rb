class CartItem < ApplicationRecord
    belongs_to :end_user
    belongs_to :item

    validates :item_id, uniqueness: true
end
