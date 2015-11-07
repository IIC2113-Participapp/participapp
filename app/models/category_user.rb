# == Schema Information
#
# Table name: category_users
#
#  id          :integer          not null, primary key
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Tabla intermedia para relacionar "Categories" con "Users" (n:n).
class CategoryUser < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
end
