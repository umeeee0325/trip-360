FactoryBot.define do
  factory :comment do
    text                     { 'aaaaaa' }
    association :user
    association :tweet
  end
end