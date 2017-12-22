class ArticlePage < BlogPage
  path '/articles{/id}'
  validate :url, %r{\/articles\/\d+\/?\z}

  element :comment_field, :fillable_field, 'comment_body'
  element :add_comment_button, :button, 'Create comment'
  element :commenter_name, :xpath, ".//p[contains(.,'Commenter:')]"
  element :comment_text, :xpath, ".//p[contains(.,'Comment:')]"
  element :destroy_comment, :xpath,
          ->(comment) { ".//p[contains(.,'#{comment}')]/following-sibling::p/a[.='Destroy Comment']" }

  element :back_to_articles, :xpath, ".//a[contains(.,'Back')]"
  element :edit_article_button, :xpath, ".//a[contains(.,'Edit')]"
end
