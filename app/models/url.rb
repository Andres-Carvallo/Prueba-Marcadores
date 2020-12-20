class Url < ApplicationRecord
  belongs_to :urlable, polymorphic: true
  
end
