class ItemScriptsController < ApplicationController
  before_action :set_repository, only: [:show, :new, :create, :destroy]
  before_action :set_item_script, only: [:show, :destroy]

  def show
    @file_content = File.read("#{Rails.root}/public" + @item_script.source_file.to_s)
  end

  def new
    @new_item_script = @repository.item_scripts.build(params[:item])
  end

  def create
    @new_item_script = @repository.item_scripts.build(item_script_params)

    respond_to do |format|
      if @new_item_script.save
        format.html { redirect_to @repository, notice: 'Script was successfully uploaded.' }
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

  def item_script_params
      params.require(:item_script).permit(:name, :source_file, :command)
  end

  def set_repository
    @repository = Repository.find(params[:repository_id])
  end

  def set_item_script
    @item_script = @repository.item_scripts.find(params[:id])
  end
end
