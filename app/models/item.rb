class Item
  include Mongoid::Document
  field :name, type: String

  validates_presence_of :name

  embedded_in :repository
end
