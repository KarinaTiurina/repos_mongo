require 'rails_helper'

RSpec.describe Repository, type: :model do
  context 'document check' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_field(:name).of_type(String) }
    it { is_expected.to embed_many :item_files }
    it { is_expected.to embed_many :item_scripts }
  end

  context 'validations check' do
    it { is_expected.to validate_presence_of :name }
  end
end
