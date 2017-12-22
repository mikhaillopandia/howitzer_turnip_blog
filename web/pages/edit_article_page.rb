require_relative 'blog_page'

class EditArticlePage < BlogPage
  path '/articles{/id}/edit'
  validate :url, %r{\/articles\/\d+\/edit\/?\z}

  element :article_title_field, :fillable_field, 'article[title]'
  element :article_text_field, :fillable_field, 'article[text]'
  element :edit_article_button, :button, 'Update Article'

  def fill_form(title: nil, text: nil)
    Howitzer::Log.info "Fill in Edit article form with title: #{title} , and body #{text}"
    article_title_field_element.set(title) unless title.nil?
    article_text_field_element.set(text) unless text.nil?
  end

  def submit_form
    Howitzer::Log.info 'Submit Edit article form'
    edit_article_button_element.click
    self
  end
end
