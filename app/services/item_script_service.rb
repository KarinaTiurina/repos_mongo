class ItemScriptService
  def initialize(repository:, name:, source_file:, command:)
    @repository = repository
    @name = name
    @source_file = source_file
    @command = command
  end

  def perform
    create_item_script!
    broadcast_item_script
  end

  private

  def create_item_script!
    @item_script ||= ItemScript.create!(repository: @repository, name: @name, source_file: @source_file, command: @command)
  end

  def broadcast_item_script
    ActionCable.server.broadcast "item_script_channel_#{@repository._id}", item_script: render_item_script
  end

  def render_item_script
    ApplicationController.renderer.render(partial: 'item_scripts/item_script', locals: {
      item_script: @item_script, repository: @repository
    })
  end
end
