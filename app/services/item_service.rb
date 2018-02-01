class ItemService
  attr_accessor :repository, :name, :source_file

  def initialize(repository, name, source_file)
    @repository = repository
    @name = name
    @source_file = source_file
  end

  def perform
    self.create_item!
    self.broadcast_item
  end
end
