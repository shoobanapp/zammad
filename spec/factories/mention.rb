FactoryBot.define do
  factory :mention do
    mentionable { create(:ticket) }
    user_id { 1 }
    created_by_id { 1 }
    updated_by_id { 1 }
  end
end
