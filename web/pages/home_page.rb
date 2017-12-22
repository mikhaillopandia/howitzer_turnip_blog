require_relative 'blog_page'

class HomePage < BlogPage
  path '/'
  validate :url, %r{\A(?:.*?:\/\/)?[^\/]*\/?\z}
end
