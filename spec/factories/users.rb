FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'aaa123'}
    password_confirmation {password}
    profile               {'テスト'}
    gender_id             {2}
    residence_id          {2}
    age_id                {2}
  end
end
