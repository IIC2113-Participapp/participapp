class AddForumToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :forum, index: true, foreign_key: true
  end
end
