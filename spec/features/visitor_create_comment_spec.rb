require "rails_helper"

feature "Comment Creation" do
  before(:each) do
    sign_up
    add_article
  end
  
  scenario "article page have a add comments" do
    expect(page).to have_content I18n.t('articles.show.add_comment')
  end

  scenario "allows a guest to add comment" do

    fill_in :comment_author, :with => 'Artur'
    fill_in :comment_body, :with => 'very intresting'

    click_button 'Create Comment'

    expect(page).to have_content 'very intresting'

  end

end
