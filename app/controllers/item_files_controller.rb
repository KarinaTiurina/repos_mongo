class ItemFilesController < ApplicationController
  before_action :set_repository, only: [:show, :new, :create, :destroy]
  before_action :set_item_file, only: [:show, :destroy]

  def show
    @file_content = File.read("#{Rails.root}/public" + @item_file.source_file.to_s)
  end

  def new
    @new_item_file = @repository.item_files.build(params[:item_file])
  end

  def create
    @new_item_file = @repository.item_files.build(item_file_params)

    respond_to do |format|
      if @new_item_file.save
        format.html { redirect_to @repository, notice: 'File was successfully uploaded.' }
        format.json { render :show, status: :created, location: @repository }
      else
        format.html { render :new }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_file.destroy

    respond_to do |format|
      format.html { redirect_to repository_url(@repository), notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def item_file_params
      params.require(:item_file).permit(:name, :source_file)
  end

  def set_repository
    @repository = Repository.find(params[:repository_id])
  end

  def set_item_file
    @item_file = @repository.item_files.find(params[:id])
  end
end
