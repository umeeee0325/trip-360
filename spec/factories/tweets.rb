FactoryBot.define do
  factory :tweet do
    residence_id             { 2 }
    title                    { 'aaaaaa' }
    text                     { 'aaaaaa' }
    city                     { 'aaaaaa' }
    spot                     { 'aaaaaa' }
    shooting_day             { '20240202' }
    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
