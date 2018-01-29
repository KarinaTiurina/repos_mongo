module Item
  extend ActiveSupport::Concern

  included do
    field :name, type: String
    field :source_file, type: String

    validates_presence_of :name, :source_file

    embedded_in :repository
  end
end
