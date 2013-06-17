
FactoryGirl.define do
  factory :item_request, :class => Refinery::ItemRequests::ItemRequest do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

