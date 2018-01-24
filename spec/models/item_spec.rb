require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:test_repository) { FactoryGirl.create(:repository) }

  let(:test_script) do
    FactoryGirl.create(:item, type: 'script', command: 'ruby', repository: test_repository)
  end

   let(:test_file) do
     FactoryGirl.create(:item, repository: test_repository)
  end

  context 'document check' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_field(:name).of_type(String) }
    it { is_expected.to have_field(:type).of_type(String) }
    it { is_expected.to have_field(:source_file).of_type(Object) }
    it { is_expected.to have_field(:command).of_type(String) }
    it { is_expected.to be_embedded_in :repository }
  end

  context 'validation check' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :type }
    it { is_expected.to validate_presence_of :source_file }

    context "if script" do
      before { allow(subject).to receive(:is_script?).and_return(true) }
      it { should validate_presence_of(:command) }
    end

    context "if file" do
      before { allow(subject).to receive(:is_script?).and_return(false) }
      it { should_not validate_presence_of(:command) }
    end
  end

  context 'is_script check' do
    it 'should be false as file' do
      expect(test_file.is_script?).to be_falsey
    end

    it 'should be true as script' do
      expect(test_script.is_script?).to be_truthy
    end
  end
end
