FactoryGirl.define do
  factory :item do
    sequence (:name) { |n| "item#{n}" }

    type 'file'

    source_file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'factories', 'test_data', 'file.txt')) }

    association :repository
  end
end
