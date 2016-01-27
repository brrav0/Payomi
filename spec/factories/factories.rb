#require 'rails_helper'

FactoryGirl.define do
  factory :bank do
  name "foo"
  number_and_street "22 W 15th"
  zip_code "00000"
  city "city"
end
end

FactoryGirl.define do
  factory :user do
  name "foo"
  email "foo@example.com"
  password "secret"
end
end

