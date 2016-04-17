require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Upload an image'
    end
  end

  context 'restaurants have been added' do
    before do
      create_post
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('#blessed')
      expect(page).not_to have_content('No posts yet')
    end
  end
  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      create_post
      expect(page).to have_content '#blessed'
      expect(current_path).to eq '/posts'
    end
  end
  context 'viewing posts' do
    scenario 'lets a user view a post' do
      create_post
      visit '/posts'
      click_link '#blessed'
      expect(page).to have_content '#blessed'
      expect(current_path).to eq "/posts/#{Post.first.id}"
    end
  end
  context 'editing posts' do
    scenario 'let a user edit a post' do
      create_post
      visit '/posts'
      click_link 'Edit'
      fill_in 'Caption', with: '#sorrynotsorry'
      click_button 'Update Post'
      expect(page).to have_content '#sorrynotsorry'
      expect(current_path).to eq '/posts'
    end
  end
  context 'deleting posts' do
    scenario 'let a user delete a post' do
      create_post
      visit '/posts'
      click_link 'Delete'
      expect(page).to have_content 'Your post has been deleted'
      expect(page).not_to have_content '#blessed'
      expect(current_path).to eq '/posts'
    end
  end
end
