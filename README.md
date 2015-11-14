# Participapp

#### [participapp.cloudapp.net](http://participapp.cloudapp.net)

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

## Running tests

1. Prepare the test database by running:

  ```sh
  $ rake db:drop db:create db:migrate db:seed RAILS_ENV=test
  ```

2. Execute the tests by running:

  ```sh
  $ bundle exec rspec
  ```

## Running metrics

We are using `MetricFu` for this.

1. Make sure that you have the gem installed by running `bundle`

2. Prepare the metrics by running:

  ```sh
  $ rake metrics:all
  ```
3. Visit the directory `tmp/metric_fu/output`, and open `index.html` with your
browser.

You should now be able to see all the metrics.
