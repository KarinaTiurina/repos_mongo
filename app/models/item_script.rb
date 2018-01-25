class ItemScript
  include Mongoid::Document
  field :name, type: String
  field :source_file, type: String
  field :command, type: String

  validates_presence_of :name, :source_file, :command

  embedded_in :repository

  mount_uploader :source_file, SourceUploader
end
