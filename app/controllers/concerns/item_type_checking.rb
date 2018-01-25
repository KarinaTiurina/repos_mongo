module ItemTypeChecking
  extend ActiveSupport::Concern

  def self.set_item(controller_class_name, repository, request)
    return repository.item_files.find(request.params[:id]) if controller_class_name.to_s == 'ItemFilesController'

    return repository.item_scripts.find(request.params[:id]) if controller_class_name.to_s == 'ItemScriptsController'
  end

  # def self.build_new_item(controller_class_name, repository)
  #   repository.item_files.build(params[:item_file])
  #     if controller_class_name == 'ItemFilesController'

  #   repository.item_files.build(params[:item_script])
  #     if controller_class_name == 'ItemScriptsController'
  # end

  # def self.build_new_item(controller_class_name, repository)
  #   repository.item_files.build(params[:item_file])
  #     if controller_class_name == 'ItemFilesController'

  #   repository.item_files.build(params[:item_script])
  #     if controller_class_name == 'ItemScriptsController'
  # end
end
