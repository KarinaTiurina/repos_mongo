require 'spec_helper'

shared_examples_for "item" do
  let(:model) { described_class } # the class that includes the concern
  let(:test_repository) { FactoryBot.create(:repository) }

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
