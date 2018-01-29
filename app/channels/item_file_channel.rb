class ItemFileChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info "Subscribed to ItemFileChannel, repoId: #{params[:repoId]}"

    @repository = Repository.find(params[:repoId])

    stream_from "item_file_channel_#{@repository._id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info "Unsubscribed from ItemFileChannel"
  end

  def load(data)
    logger.info "ItemFileChannel, load: #{data.inspect}"

    ActionCable.server.broadcast "item_file_channel_#{@repository._id}", message: 'Hello from server!'
  end
end
