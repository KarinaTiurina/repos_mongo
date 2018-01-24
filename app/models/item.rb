class Item
  include Mongoid::Document
  field :name, type: String
  field :source_file, type: String
  field :type, type: String
  # field :type, type: Symbol

  validates_presence_of :name, :source_file, :type

  embedded_in :repository

  mount_uploader :source_file, SourceUploader
end
