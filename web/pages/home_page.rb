class HomePage < BlogPage
  path '/'
  validate :url, %r{\A(?:.*?:\/\/)?[^\/]*\/?\z}
end
