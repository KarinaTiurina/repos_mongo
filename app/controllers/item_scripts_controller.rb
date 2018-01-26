class ItemScriptsController < ApplicationController
  include ItemsController

  private

  def item_params
    params.require(:item_script).permit(:name, :source_file, :command)
  end
end
