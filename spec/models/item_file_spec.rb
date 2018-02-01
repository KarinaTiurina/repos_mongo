require 'rails_helper'
require Rails.root.join "spec/concerns/item_spec.rb"

RSpec.describe ItemFile, type: :model do
  it_behaves_like "item"
end
