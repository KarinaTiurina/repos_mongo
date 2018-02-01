require 'spec_helper'

shared_examples_for "items_controller" do
  let(:model) { described_class } # the class that includes the concern

  let(:test_repository) { create(:repository) }
  let(:test_item) { create(model.name.underscore.gsub('s_controller','').to_sym) }

  # describe '#show' do
  #   it 'show list' do
  #     get :show, params: { id: test_item._id, repository_id: test_repository._id }

  #     expect(response.status).to eq(200)
  #     expect(response).to render_template('show')
  #   end
  # end
end