class ArticlesPage < BlogPage
  path '/articles'
  validate :url, %r{/articles/?}
end
