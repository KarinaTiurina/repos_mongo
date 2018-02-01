class ItemScriptChannel < ItemChannel
  def load(data)
    logger.info "********************************************************************"
    logger.info "ItemScriptChannel, load: #{data.inspect}"
    logger.info "********************************************************************"

    ItemScriptService.new(
      repository: @repository, name: data['name'], source_file: data['source_file'], command: data['command']
    ).perform
  end
end
