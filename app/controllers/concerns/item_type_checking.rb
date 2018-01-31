module ItemTypeChecking
  extend ActiveSupport::Concern

  def self.set_item(controller_class_name, repository, request)
    repository.method(items(controller_class_name)).call.find(request.params[:id])
  end

  def self.build_new_item(controller_class_name, repository, request)
    current_items = items(controller_class_name)
    repository.method(current_items).call.build(request.params[current_items.singularize.to_sym])
  end

  def self.build_to_create_item(controller_class_name, repository, item_params)
    repository.method(items(controller_class_name)).call.build(item_params)
  end

  private

  def self.items(controller_class_name)
    controller_class_name.to_s.gsub("sController", '').tableize
  end
end
