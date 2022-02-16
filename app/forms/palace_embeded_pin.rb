class PalaceEmbededPin
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  # なんだっけこれ
  attr_accessor :name, :created_by, :group1, :group2, :group3, :embeded_pins

  def save
    ActiveRecord::Base.transaction do
      # self.nameとかをnameと省略できるっぽい
      palace = Palace.create(name: name, created_by: created_by, group1: group1, group2: group2, group3: group3, held_by: "fsafda")
      embeded_pins.each do |embeded_pin|
        # ここでembeded_pinはインスタンスじゃないからシンボルで呼び出す
        EmbededPin.create(number: embeded_pin[:number], x: embeded_pin[:x], y: embeded_pin[:y], palace_id: palace.id)
      end
    end  
  end
end