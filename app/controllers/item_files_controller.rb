class ItemFilesController < ApplicationController
  include ItemsController

  private

  def item_file_params
      params.require(:item_file).permit(:name, :source_file)
  end
end
