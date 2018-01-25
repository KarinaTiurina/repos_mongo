module ItemsController
  extend ActiveSupport::Concern
  include ItemTypeChecking

  included do
    before_action :set_repository, only: [:show, :new, :create, :destroy]
    before_action :set_item, only: [:show, :destroy]

    def show
      @file_content = File.read("#{Rails.root}/public" + @item.source_file.to_s)
    end

    def new
      @new_item = ItemTypeChecking.build_new_item(self.class, @repository, request)
    end

    def create
      @new_item = ItemTypeChecking.build_to_create_item(self.class, @repository, item_params)
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

    def set_repository
      @repository = Repository.find(params[:repository_id])
    end

    def set_item
      @item = ItemTypeChecking.set_item(self.class, @repository, request)
    end
  end
end
