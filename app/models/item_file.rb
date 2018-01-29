class ItemFile
  include Mongoid::Document
  include Item

  mount_base64_uploader :source_file, SourceUploader
end
