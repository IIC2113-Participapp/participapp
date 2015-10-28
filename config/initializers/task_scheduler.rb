require 'rubygems'
require 'rake'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new
scheduler.every '6h' do
  system 'bundle exec rake mailer:deliver_news'
end
