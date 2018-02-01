class ItemFileChannel < ItemChannel
  def load(data)
    logger.info "********************************************************************"
    logger.info "ItemFileChannel, load: #{data.inspect}"
    logger.info "********************************************************************"

    ItemFileService.new(
      repository: @repository, name: data['name'], source_file: data['source_file']
    ).perform
  end
end
