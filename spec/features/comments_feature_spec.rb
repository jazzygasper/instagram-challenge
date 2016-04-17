require 'rails_helper'

feature 'commenting' do

  scenario 'allows users to leave a comment using a form' do
    create_post
     visit '/posts'
     click_link '#blessed'
     click_link 'Comment'
     fill_in "Comment", with: "so so"
     click_button 'Send'

     expect(current_path).to eq "/posts/#{Post.first.id}"
     expect(page).to have_content 'so so'
  end

end
