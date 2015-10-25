namespace :mailer do
  task :deliver_news => :environment do
    mails_to_send = User.retreive_by_periodicity

    if mails_to_send.any?
      current_receiver_id = mails_to_send.first.receiver_id
      collection = []
      mails_to_send.each do |mail_to_send|
        if mail_to_send.receiver_id == current_receiver_id
          collection << mail_to_send
        else
          user = User.find_by(id: current_receiver_id)
          puts "sending to #{user.first_name}"
          NewsMailer.periodic_mail(user, collection).deliver
          collection = []
          current_receiver_id = mail_to_send.receiver_id
          collection << mail_to_send
        end
      end

      if mails_to_send.size > 1
        user = User.find_by(id: current_receiver_id)
        puts "sending to #{user.first_name}"
        NewsMailer.periodic_mail(user, collection).deliver
      end
    end
  end
end
