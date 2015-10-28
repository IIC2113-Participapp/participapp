class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@participapp.com"
  layout 'mailer'
end
