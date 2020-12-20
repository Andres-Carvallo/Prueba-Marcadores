class Bookmark < ApplicationRecord
    has_many :categories, dependent: :destroy
end
