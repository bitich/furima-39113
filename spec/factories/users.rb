FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    lastname              {"雄二"}
    firstname             {"山田"}
    lastnamekana          {"ユウジ"}
    firstnamekana         {"ヤマダ"}
    birthday              {"1930-01-01"}
    password              {"a123456"}
    password_confirmation {password}
  end
end


