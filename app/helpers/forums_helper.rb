module ForumsHelper
  def forum_creator forum
    user = User.find(forum.user_id)
    return "#{user.first_name} #{user.last_name}"
  end
end
