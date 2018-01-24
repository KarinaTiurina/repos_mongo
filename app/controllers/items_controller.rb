class ItemsController < ApplicationController
  before_action :set_repository, only: [:show, :new, :create, :destroy]
  before_action :set_item, only: [:show, :destroy]

  def show
    @file_content = File.read("#{Rails.root}/public" + @item.source_file.to_s)
  end

  def new
    @new_item = @repository.items.build(params[:item])
  end

  def create
    @new_item = @repository.items.build(item_params)

    respond_to do |format|
      if @new_item.save
        format.html { redirect_to @repository, notice: 'Item was successfully uploaded.' }
        format.json { render :show, status: :created, location: @repository }
      else
        format.html { render :new }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to repository_url(@repository), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def item_params
      params.require(:item).permit(:name, :source_file, :type, :command)
  end

  def set_repository
    @repository = Repository.find(params[:repository_id])
  end

  def set_item
    @item = @repository.items.find(params[:id])
  end
end
