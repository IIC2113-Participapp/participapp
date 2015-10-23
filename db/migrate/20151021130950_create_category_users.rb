class CreateCategoryUsers < ActiveRecord::Migration
  def change
    create_table :category_users do |t|
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
