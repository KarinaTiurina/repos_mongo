module ItemTypeChecking
  extend ActiveSupport::Concern

  def self.set_item(controller_class_name, repository, request)
    return repository.item_files.find(request.params[:id]) if controller_class_name.to_s == 'ItemFilesController'

    return repository.item_scripts.find(request.params[:id]) if controller_class_name.to_s == 'ItemScriptsController'
  end

  def self.build_new_item(controller_class_name, repository, request)
    return repository.item_files.build(request.params[:item_file]) if controller_class_name.to_s == 'ItemFilesController'

    return repository.item_scripts.build(request.params[:item_script]) if controller_class_name.to_s == 'ItemScriptsController'
  end

  def self.build_to_create_item(controller_class_name, repository, item_params)
    return repository.item_files.build(item_params) if controller_class_name.to_s == 'ItemFilesController'

    return repository.item_scripts.build(item_params) if controller_class_name.to_s == 'ItemScriptsController'
  end
end
