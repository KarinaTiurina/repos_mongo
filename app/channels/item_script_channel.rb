class ItemScriptChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info "Subscribed to ItemScriptChannel, repoId: #{params[:repoId]}"

    @repository = Repository.find(params[:repoId])

    stream_from "item_script_channel_#{@repository._id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info "Unsubscribed from ItemScriptChannel"
  end

  def load(data)
    logger.info "********************************************************************"
    logger.info "ItemScriptChannel, load: #{data.inspect}"
    logger.info "********************************************************************"

    ItemScriptService.new(
      repository: @repository, name: data['name'], source_file: data['source_file'], command: data['command']
    ).perform
  end
end
