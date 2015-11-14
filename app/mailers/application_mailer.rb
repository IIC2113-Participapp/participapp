class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@participapp.com"
  layout 'mailer'
  ActionMailer::Base.default :content_type => "text/html"
end
