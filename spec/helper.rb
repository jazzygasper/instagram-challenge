def create_post
  visit '/posts'
  click_link 'Upload an image'
  fill_in 'Caption', with: '#blessed'
  click_button 'Share'
end
