class OrderedItem < ApplicationRecord
    belongs_to :order
    belongs_to :item

    enum production_status: { a: 0, b: 1, c: 2, d: 3 }
end
