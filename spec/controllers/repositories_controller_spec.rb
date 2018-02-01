require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  let(:test_repository) { create(:repository) }

  describe '#show' do
    it 'show list' do
      get :show, params: { id: test_repository._id }

      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end

  describe '#index' do
    it 'show list of repositories' do
      get :index

      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  # describe '#create' do
  #   it 'creates repository' do
  #     post :create, repository: {name: 'repo2'}

  #     repository = assigns(:repository)

  #     expect(repository.name).ro eq('repo2')

  #     expect(response).to redirect_to(root_path)
  #   end
  # end
end
