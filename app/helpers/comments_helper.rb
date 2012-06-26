module CommentsHelper
  def add_comment_number_links(comment)
    regex = /#[0-9]+/
    comment.sub(regex) { |match| "<a href = #{match}>#{match}</a>" }.html_safe
  end
  
  def escape_chars
  end
end