class BlogPage < Howitzer::Web::Page
  element :menu_item, :xpath, ->(name) { ".//a[.='#{name}']" }

  def choose_menu(text)
    Howitzer::Log.info "Open '#{text}' menu"
    menu_item_element(text).click
  end

  private

  def accept_js_confirmation
    execute_script 'window.confirm = function(){return true;}'
    yield
    window_confirm
  end

  def dismiss_js_confirmation
    execute_script 'window.confirm = function(){return false;}'
    yield
    window_confirm
  end

  def window_confirm
    execute_script 'return window.confirm'
  end
end
