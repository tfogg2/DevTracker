FactoryGirl.define do
  factory :message do
    user
    conversation
    body "hello world"
  end
end
