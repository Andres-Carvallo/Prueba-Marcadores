class SubCategory < ApplicationRecord
    belongs_to :category
    has_many :urls, as: :urlable
end
