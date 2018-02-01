class ItemChannel < ApplicationCable::Channel
  def subscribed
    @current_channel = self.class.to_s.underscore
    logger.info "Subscribed to #{@current_channel}, repoId: #{params[:repoId]}"

    @repository = Repository.find(params[:repoId])

    stream_from "#{@current_channel}_#{@repository._id}"
  end

  def unsubscribed
    logger.info "Unsubscribed from #{@current_channel}"
  end
end
