class Item < ApplicationRecord

    has_many :cart_items
    has_many :ordered_items
    attachment :image
    belongs_to :genre

    enum sales_status: { on_sale: 0, off_sale: 1 }

    def self.search(search)
        if search
            where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。#User.は省略
        else
            all #全て表示。#User.は省略
        end
    end
end
