# Participapp

## Grupo 4
> Esteban Sandoval  ([ejsandoval@uc.cl](mailto:ejsandoval@uc.cl))

> Franco Muñoz      ([famunoz13@uc.cl](mailto:famunoz13@uc.cl))

> Ignacio Ferrer    ([iaferrer@uc.cl](mailto:iaferrer@uc.cl))

> Juan Celhay       ([jicelhay@uc.cl](mailto:jicelhay@uc.cl))

> Nebil Kawas       ([nakawas@uc.cl](mailto:nakawas@uc.cl))

> Nicolás Cerda     ([nlcerda@uc.cl](mailto:nlcerda@uc.cl))

> Sebastián Salata  ([sasalata@uc.cl](mailto:sasalata@uc.cl))

## Development Setup

1. Clone this repo.

2. Run `bundle install`

3. Setup the environment variables for the mailer by using your favourite
editor. In this case, we will assume you use nano editor and bash shell:

  ```sh
  $ nano $HOME/.bashrc
  ```

  Setup the variables by writing them as follows:
  ```sh
  export PAPP_GMAIL_USERNAME="your-application's-email"
  export PAPP_GMAIL_PASSWORD="your-application's-email-password"
  ```

4. Setup the DB as follows:

  ```sh
  $ rake db:create
  $ rake db:migrate
  $ rake db:seed
  ```

5. Run the server by executing `rails s`
