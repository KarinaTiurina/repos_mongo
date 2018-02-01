FactoryBot.define do
  factory :item_file do
    sequence (:name) { |n| "file#{n}" }

    source_file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'factories', 'test_data', 'file.txt')) }

    association :repository
  end
end
