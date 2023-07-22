FactoryBot.define do
  factory :order_add do
    post {"111-1111"}
    build {"福岡ビル"}
    prefecture_id {2}
    city {"大野城市"}
    address {"1-1-2"}
    tell {"09073855911"}
    token {"tok_abcdefghijk00000000000000000"}
    
    association :user 

end
end

