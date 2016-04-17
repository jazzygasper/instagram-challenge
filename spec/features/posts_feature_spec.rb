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
      Post.create(caption: '#blessed')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('#blessed')
      expect(page).not_to have_content('No posts yet')
    end
  end
  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Upload an image'
      fill_in 'Caption', with: '#blessed'
      click_button 'Share'
      expect(page).to have_content '#blessed'
      expect(current_path).to eq '/posts'
    end
  end
end
