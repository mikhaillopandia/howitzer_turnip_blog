require_relative 'blog_page'

class ArticlesPage < BlogPage
  path '/articles'
  validate :url, %r{/articles/?}

  element :article_button, :xpath, ->(title) { "//a[contains(.,'#{title}')]" }
  element :destroy_button, :xpath,
          ->(title) { "//td[.='#{title}']/following-sibling::td/a[normalize-space(.)='Destroy']" }
  element :edit_button, :xpath,
          ->(title) { "//td[.='#{title}']/following-sibling::td/a[normalize-space(.)='Edit']" }
  element :article_link, :link, ->(text) { text }, match: :first

  def add_new_article
    Howitzer::Log.info 'Adding new article'

    new_article_button_element.click
    NewArticlePage.given
  end

  def edit_article(title)
    Howitzer::Log.info "Edit article: '#{title}'"
    edit_button_element(title).click
  end

  def destroy_article(title, confirmation = true)
    Howitzer::Log.info "Destroy article: '#{title}' with confirmation: '#{confirmation}'"
    destroy = -> { destroy_button_element(title).click }
    if confirmation
      accept_js_confirmation { destroy.call }
    else
      dismiss_js_confirmation { destroy.call }
    end
  end

  def open_article(text)
    Howitzer::Log.info "Open '#{text}' article"
    if main_menu_section.tablet_screen?
      article_link_element(text).click
    else
      article_button_element(text).click
    end
  end
end
