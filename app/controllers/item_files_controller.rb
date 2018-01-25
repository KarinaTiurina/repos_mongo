class ItemFilesController < ApplicationController
  include ItemsController

  private

  def item_params
      params.require(:item_file).permit(:name, :source_file)
  end
end
