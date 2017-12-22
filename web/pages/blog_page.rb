class BlogPage < Howitzer::Web::Page
  element :menu_item, :xpath, ->(name) { ".//a[.='#{name}']" }

  def choose_menu(text)
  Howitzer::Log.info "Open '#{text}' menu"
    menu_item_element(text).click
  end
end
