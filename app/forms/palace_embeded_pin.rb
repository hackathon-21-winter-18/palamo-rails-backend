class PalaceEmbededPin
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  # なんだっけこれ
  attr_accessor :name, :created_by, :group1, :group2, :group3, :number, :x, :y

  def save
    ActiveRecord::Base.transaction do
      palace = Palace.create(name: name, created_by: created_by, group1: group1, group2: group2, group3: group3, held_by: "fsafda")
      EmbededPin.create(number: number, palace_id: palace.id, x: x, y: y)
    end  
  end
end