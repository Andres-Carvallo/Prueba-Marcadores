class Category < ApplicationRecord
    has_many :sub_categories, dependent: :destroy
    belongs_to :bookmark
    has_many :urls, as: :urlable
end
