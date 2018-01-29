class ItemScript
  include Mongoid::Document
  include Item

  field :command, type: String

  validates_presence_of :command

  mount_uploader :source_file, SourceUploader
end
