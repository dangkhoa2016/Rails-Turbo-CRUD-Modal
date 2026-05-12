# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }

    it 'validates uniqueness of title' do
      create(:post, title: 'Unique Title')
      post = build(:post, title: 'Unique Title')
      expect(post).not_to be_valid
    end
  end
end
