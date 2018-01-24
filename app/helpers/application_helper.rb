module ApplicationHelper
  def show_item_type(item)
    'script' if item.type == :script
    'file' if item.type == :file
  end
end
