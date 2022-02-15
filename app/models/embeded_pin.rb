class EmbededPin < ApplicationRecord
  belongs_to :palace, foreign_key: true
end