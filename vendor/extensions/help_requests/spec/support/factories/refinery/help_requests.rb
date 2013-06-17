
FactoryGirl.define do
  factory :help_request, :class => Refinery::HelpRequests::HelpRequest do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

