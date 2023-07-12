require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let!(:valid_attributes) do
    {
      title: 'Hello',
      text: 'This is my first post',
      author_id: user.id
    }
  end

  describe 'GET /index' do
    it 'returns a successful response' do
      get user_posts_url(user)
      expect(response).to be_successful
    end

    it 'renders a correct template' do
      get user_posts_url(user)
      expect(response).to render_template('posts')
    end

    it 'includes a placeholder' do
      get user_posts_url(user)
      expect(response.body).to include('Number of posts: 100')
    end
  end
end
