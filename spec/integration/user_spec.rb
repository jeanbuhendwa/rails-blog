require 'rails_helper'
 RSpec.describe User, type: :system do
   subject { User.new(name: 'karan', posts_counter: 11, photo: 'https://randomuser.me/api/portraits/thumb/men/77.jpg', bio: 'Teacher from india.') }
   before { subject.save }
   describe 'index page' do
     it 'I can see the username of all other users.' do
       visit root_path(subject)
       page.has_content?(subject.name)
     end
     it 'I can see the profile picture for each user' do
       visit root_path(subject)
       page.has_content?(subject.photo)
     end
     it 'I can see the number of posts each user has written.' do
       visit root_path(subject)
       page.has_content?(subject.posts_counter)
     end
     it "When I click on a user, I am redirected to that user's show page." do
       user2 = User.create(name: 'Lilly', posts_counter: 11, photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher from Poland.')
       visit root_path(user2)
       click_on 'Lilly'
       expect(page).to have_current_path("/users/#{user2.id}")
     end
   end