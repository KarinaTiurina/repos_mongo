require 'rails_helper'
require Rails.root.join "spec/concerns/items_controller_spec.rb"

RSpec.describe ItemFilesController, type: :controller do
  it_behaves_like "items_controller"
end
