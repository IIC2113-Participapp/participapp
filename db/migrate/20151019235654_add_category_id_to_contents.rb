class AddCategoryIdToContents < ActiveRecord::Migration
  def change
    add_reference :contents, :category, index: true, foreign_key: true
  end
end
