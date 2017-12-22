# rubocop:disable Style/ClassAndModuleChildren
module Turnip::Steps
  # rubocop:enable Style/ClassAndModuleChildren
  # GIVEN
  # rubocop:disable Style/SymbolProc
  attr_accessor :article

  step ':page page of web application' do |page|
    page.open
  end

  step 'I am on :page page' do |page|
    page.open
  end

  step 'I am on New article page' do
    NewArticlePage.open
  end

  step 'I fill and submit form on new article page with correct data' do
    s = self
    self.article = build(:article)
    NewArticlePage.on do
      fill_form(title: s.article.title, text: s.article.text)
      submit_form
    end
  end

  # WHEN
  step 'I click My Blog on :page page' do |page|
    page.on { choose_menu('My Blog') }
  end

  step 'I open :page page' do |page|
    page.open
  end

  step 'there is an article' do
    self.article = create(:article)
  end

  # THEN
  step 'I should be redirected to :page page' do |page|
    expect(page).to be_displayed
  end

  step 'I should see following text on articles page:' do |text|
    expect(ArticlesPage.given.text).to include(text)
  end

  step 'I should see following text on article page:' do |text|
    expect(ArticlesPage.given.text).to include(text)
  end
end
