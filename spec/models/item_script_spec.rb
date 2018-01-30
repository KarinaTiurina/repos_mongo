require 'rails_helper'
require Rails.root.join "spec/concerns/item_spec.rb"

RSpec.describe ItemScript, type: :model do
  it_behaves_like "item"

  context 'document check' do
    it { is_expected.to have_field(:command).of_type(String) }
  end

  context 'validation check' do
    it { is_expected.to validate_presence_of :command }
  end
end
