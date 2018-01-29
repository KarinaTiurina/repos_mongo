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
    logger.info "********************************************************************"
    logger.info "ItemFileChannel, load: #{data.inspect}"
    logger.info "********************************************************************"

    ItemFileService.new(
      repository: @repository, name: data['name'], source_file: data['source_file']
    ).perform
  end
end
