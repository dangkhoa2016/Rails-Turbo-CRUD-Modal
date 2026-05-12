# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.unique.sentence }
    body { Faker::Lorem.paragraph }
  end
end
