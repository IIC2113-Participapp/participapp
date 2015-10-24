class NewsMailer < ApplicationMailer

  # - Envía un correo al usuario con el content indicado en los parámetros.
  # - Pre-condiciones: en la tabla "Users", hay una entrada cuyo valor de
  # "last_received" es X.
  # - Post-condiciones: en la tabla "Users", la entrada mencionada anteriormente
  # tiene un valor de X + "Time.now" en "last_received".
  def periodic_mail user, contents
    @user = user
    @user.update_attribute(:last_received, Time.now)
    @contents = contents

    mail to: @user.email, subject: "[Participapp] novedades de hace #{@user.periodicity} días."
  end
end
