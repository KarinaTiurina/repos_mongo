class ItemScriptService < ItemService
  attr_accessor :command

  def initialize(repository:, name:, source_file:, command:)
    super(repository, name, source_file)
    @command = command
  end

  protected

  def create_item!
    @item_script ||= ItemScript.create!(repository: @repository, name: @name, source_file: @source_file, command: @command)
  end

  def broadcast_item
    ActionCable.server.broadcast "item_script_channel_#{@repository._id}", item_script: render_item_script
  end

  def render_item_script
    ApplicationController.renderer.render(partial: 'item_scripts/item_script', locals: {
      item_script: @item_script, repository: @repository
    })
  end
end
