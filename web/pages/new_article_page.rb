class NewArticlePage < BlogPage
  path '/articles/new'
  validate :url, %r{/articles/new/?}
end
