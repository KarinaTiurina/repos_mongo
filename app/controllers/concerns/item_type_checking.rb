module ItemTypeChecking
  extend ActiveSupport::Concern

  def self.set_item(controller_class_name, repository, request)
    repository.method(NameHelper.tableize(controller_class_name)).call.find(request.params[:id])
  end

  def self.build_new_item(controller_class_name, repository, request)
    items = NameHelper.tableize(controller_class_name)
    model = NameHelper.underscore(controller_class_name)
    repository.method(items).call.build(request.params[model.to_sym])
  end

  def self.build_to_create_item(controller_class_name, repository, item_params)
    repository.method(NameHelper.tableize(controller_class_name)).call.build(item_params)
  end
end
