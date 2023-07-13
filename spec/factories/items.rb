FactoryBot.define do
  factory :item do
    id                   {1}
    name                 {"名前"}
    price                {500}
    explanation                 {"テスト"}
    condition_id         {2}
    category_id          {2}
    prefecture_id        {2}
    postage_id               {2}
    shipment_id            {2}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user 


  end
end