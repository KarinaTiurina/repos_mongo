require 'rails_helper'

RSpec.describe ItemFile, type: :model do
  let(:test_repository) { FactoryGirl.create(:repository) }

   let(:test_file) do
     FactoryGirl.create(:item_file, repository: test_repository)
  end

  context 'document check' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_field(:name).of_type(String) }
    it { is_expected.to have_field(:source_file).of_type(Object) }
    it { is_expected.to be_embedded_in :repository }
  end

  context 'validation check' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :source_file }
  end
end
