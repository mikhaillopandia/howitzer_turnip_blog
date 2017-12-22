module AddArticleSteps
  attr_accessor :article

  # GIVEN

  # WHEN

  step 'I click New article on :page page' do |page|
    page.on { choose_menu('New article') }
  end

  step 'I fill and submit form on new article page with blank data' do
    NewArticlePage.on do
      fill_form
      submit_form
    end
  end

  step "I fill and submit form on new article page with data less than 5 characters in 'Title' field" do
    s = self
    self.article = build(:article)
    NewArticlePage.on do
      fill_form(title: '1234', text: s.article.text)
      submit_form
    end
  end

  # THEN

  step 'I should see newly created article with correct data on article page' do
    s = self
    ArticlePage.on do
      expect(text).to include(s.article.title)
      expect(text).to include(s.article.text)
    end
  end

  step 'I should see newly created article with correct data on articles page' do
    s = self
    ArticlesPage.on do
      expect(text).to include(s.article.title)
      expect(text).to include(s.article.text)
    end
  end
end

RSpec.configure { |c| c.include AddArticleSteps, add_article_steps: true }
