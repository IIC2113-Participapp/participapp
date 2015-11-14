# Preview all emails at http://localhost:3000/rails/mailers/news_mailer
class NewsMailerPreview < ActionMailer::Preview
def welcome
  NewsMailer.periodic_mail(User.first, Content.first)
end

end
