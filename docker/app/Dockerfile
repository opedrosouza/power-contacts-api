FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

ENV RAILS_ROOT /var/www/jampagenda
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT
COPY . $RAILS_ROOT

RUN rm -rf ./docker

RUN gem install bundler
RUN bundle config set --local without 'development test'
RUN bundle config --delete without
RUN bundle config --delete with

RUN bundle install

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
