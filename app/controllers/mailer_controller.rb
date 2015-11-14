class MailerController < ApplicationController
  def periodic_mail
    @user = User.last
    @contents=Content.last(2)
    render :file => 'news_mailer/periodic_mail', :layout => 'mailer'
  end
end
