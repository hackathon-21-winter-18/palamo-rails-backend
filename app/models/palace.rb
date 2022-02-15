class Palace < ApplicationRecord
  include AppIdGenerator
  # cascadeと同じ多分(sqlはみてない)
  has_many :embeded_pins, dependent: :destroy
end