class RemoveTopicFromForum < ActiveRecord::Migration
  def change
    remove_column :forums, :topic, :string
  end
end
