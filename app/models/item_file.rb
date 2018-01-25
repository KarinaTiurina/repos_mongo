class ItemFile
  include Mongoid::Document
  field :name, type: String
  field :source_file, type: String

  validates_presence_of :name, :source_file

  embedded_in :repository

  mount_uploader :source_file, SourceUploader
end
