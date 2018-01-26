class RepositoryChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info "Subscribed to RepositoryChannel"

    stream_from 'repository_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info "Unsubscribed to RepositoryChannel"
  end

  def load(data)
    logger.info "RepositoryChannel, load: #{data.inspect}"

    ActionCable.server.broadcast 'repository_channel', message: 'Hello from server!'
  end
end
