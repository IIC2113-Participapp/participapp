# ContentsController
#
# + home
# + about
# + contact
#
class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end

  def about
  	@user = User.new
  end

  def contact
  	@user = User.new
  end
end
