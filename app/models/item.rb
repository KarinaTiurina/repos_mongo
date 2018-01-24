class Item
  include Mongoid::Document
  field :name, type: String
  field :source_file, type: String
  field :type, type: String
  # field :type, type: Symbol
  field :command, type: String

  validates_presence_of :name, :source_file, :type
  validates_presence_of :command, if: :is_script?

  embedded_in :repository

  mount_uploader :source_file, SourceUploader

  def is_script?
    type == 'script'
  end
end
