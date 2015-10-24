class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end

  def about
  end

  def contact
  end

  def mailer_example
    @result = User
     .joins(:category_users)
     .joins('JOIN contents ON category_users.category_id = contents.category_id')
     .where('contents.authorization_status' => 'authorized')
     .where('julianday() - julianday(users.last_post) >= users.periodicity')
     .select('users.id AS user_id_result, users.last_post, users.periodicity , contents.*')
     .order('user_id_result')

    #@result.sort_by {|task| task.id}

  end
end
