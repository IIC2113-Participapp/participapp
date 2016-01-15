FROM rails:onbuild

MAINTAINER Sebastian Salata R-T <SA.SalataRT@GMail.com>

ENV RAILS_ENV production

RUN bundle exec rake assets:precompile

EXPOSE 3000
