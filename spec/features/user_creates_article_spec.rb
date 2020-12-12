require "rails_helper"
require "database_cleaner"
feature "Article Creation" do
  before(:each) do
    sign_up
  end

  scenario "allows user to visit new article page" do
    visit new_article_path
    expect(page).to have_content I18n.t('articles.new_article')
end

  scenario "allows a user to create new article" do
    visit new_article_path

    fill_in :article_title, :with => 'good new'
    fill_in :article_text, :with => 'hi, this is good new'

    click_button 'Save Article'

    expect(page).to have_content 'good new'
  end
end
