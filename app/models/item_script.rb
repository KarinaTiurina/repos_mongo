class ItemScript
  include Mongoid::Document
  include Item

  field :command, type: String

  validates_presence_of :command
end
