class ItemFileService < ItemService
  def initialize(repository:, name:, source_file:)
    super(repository, name, source_file)
  end

  def perform
    create_item_file!
    broadcast_item_file
  end

  private

  def create_item_file!
    @item_file ||= ItemFile.create!(repository: @repository, name: @name, source_file: @source_file)
  end

  def broadcast_item_file
    ActionCable.server.broadcast "item_file_channel_#{@repository._id}", item_file: render_item_file
  end

  def render_item_file
    ApplicationController.renderer.render(partial: 'item_files/item_file', locals: {
      item_file: @item_file, repository: @repository
    })
  end
end
