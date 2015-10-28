module ForumsHelper
  def forum_creator forum
    user = User.find(forum.user_id)
    return "#{user.first_name} #{user.last_name}"
  end

  def get_comment_date comment
    date = comment.updated_at.to_formatted_s(:db)
    return "#{date}"
  end
end
