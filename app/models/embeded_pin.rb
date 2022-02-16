class EmbededPin < ApplicationRecord
  # foreign_key trueにするとなぜかpinのinsertが実行されない
  belongs_to :palace
end