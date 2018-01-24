class Repository
  include Mongoid::Document
  field :name, type: String

  validates_presence_of :name

  embeds_many :items
end
