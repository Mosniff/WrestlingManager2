FactoryBot.define do
  
  # factory :user do
  #   username "Barvis"
  #   email "test@test.com"
  #   password "123456"
  # end

  factory :match do
  end

  factory :performer do
  end

  factory :match_performer do
    match
    performer
  end
end