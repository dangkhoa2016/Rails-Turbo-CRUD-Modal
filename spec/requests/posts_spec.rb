# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:post_record) { create(:post) }

  describe 'GET /posts' do
    it 'returns a successful response' do
      get posts_path
      expect(response).to be_successful
      expect(response.body).to include(post_record.title)
    end
  end

  describe 'GET /posts/:id' do
    it 'returns a successful response' do
      get post_path(post_record)
      expect(response).to be_successful
      expect(response.body).to include(post_record.title)
    end
  end

  describe 'POST /posts' do
    context 'with valid parameters' do
      let(:valid_attributes) { { post: { title: 'New Post', body: 'New Body' } } }

      it 'creates a new Post' do
        expect do
          post posts_path, params: valid_attributes
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post posts_path, params: valid_attributes
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { post: { title: '', body: 'Body' } } }

      it 'does not create a new Post' do
        expect do
          post posts_path, params: invalid_attributes
        end.to change(Post, :count).by(0)
      end

      it 'returns an unprocessable entity response' do
        post posts_path, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
