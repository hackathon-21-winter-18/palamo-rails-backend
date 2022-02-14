module AppIdGenerator
  def self.included(klass)
    klass.before_create :fill_id
  end

  def fill_id
    self.id = loop do
      uuid = SecureRandom.uuid
      break uuid unless self.class.exists?(id: uuid)
    end
    if self.originalID == nil
      self.originalID = self.id
    end
  end
end