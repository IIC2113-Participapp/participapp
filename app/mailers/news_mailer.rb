class NewsMailer < ApplicationMailer

  # - Envía un correo al usuario con el content indicado en los parámetros.
  # - Pre-condiciones: no hay una entrada en la tabla "received_email" que
  # relacione un usuario con un content.
  # - Post-condiciones: hay una entrada en la tabla "received_email" que
  # relaciona un usuario con un content.
  def periodic_mail user, content
    @user = user

    mail to: @user.email, subject: "#{content.title}"
  end
end
