require_relative 'blog_page'

class ArticlesPage < BlogPage
  path '/articles'
  validate :url, %r{/articles/?}
end
