namespace :mailer do
  task :deliver_news => :environment do
    puts 'executing delivery'

    mails_to_send = User.fetch_for_mailing.group_by { |row| row.receiver_id }

    mails_to_send.each do |key, value|
      user = User.find_by(id: key)
      puts "sending to #{user.first_name}"
      NewsMailer.periodic_mail(user, value).deliver
    end
  end
end