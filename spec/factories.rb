FactoryBot.define do
  
  factory :user do
    email { Faker::Internet.safe_email }
    password { "123456" }
  end

  factory :match do
    promotion
  end

  factory :performer do
  end

  factory :match_performer do
    match
    performer
  end

  factory :promotion do
    user
  end

  factory :championship do
  end

  factory :title_reign do
    championship
  end
end