FactoryGirl.define do
  factory :item_script do
    sequence (:name) { |n| "scirpt#{n}" }

    command 'php'

    source_file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'factories', 'test_data', 'file2.php')) }

    association :repository
  end
end
