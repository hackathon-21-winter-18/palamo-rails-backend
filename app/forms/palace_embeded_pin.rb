class PalaceEmbededPin
  # validationが便利にできるやつ
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  # インスタンス変数の書き込み、読み込み可能にする。書かないとnewができない。
  attr_accessor :id, :name, :created_by, :held_by, :group1, :group2, :group3, :embeded_pins

  # self.nameとかをnameと省略できるっぽい
  def save
    pins = []
    ActiveRecord::Base.transaction do
      # transactionのスコープ外でpalace_idを返すために@をつけている。
      @palace = Palace.create(
        name:,
        created_by:,
        group1:,
        group2:,
        group3:,
        held_by:,
        number_of_embeded_pins: self.embeded_pins.length
      )

      # bulk insert
      embeded_pins.each do |embeded_pin|
        # ここでembeded_pinはインスタンスじゃないからシンボルで呼び出す
        pins << EmbededPin.new(
          number: embeded_pin[:number],
          x: embeded_pin[:x],
          y: embeded_pin[:y],
          word: embeded_pin[:word],
          place: embeded_pin[:place],
          situation: embeded_pin[:situation],
          group_number: embeded_pin[:group_number],
          palace_id: @palace.id
        )
      end
      # postgleSqlなら返り値でinsertしたやつとってこれるからそれでとってこないと、自動生成したやつらを返せない
      EmbededPin.import pins
    end
    return @palace, pins
  end
end
