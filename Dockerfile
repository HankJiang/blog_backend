FROM ruby:2.6.5-alpine3.11

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk --update add build-base nodejs tzdata git \
    postgresql-dev libxslt-dev libxml2-dev shared-mime-info\
    yarn libcurl \
    && rm -rf /var/cache/apk/*

RUN gem install bundler:2.0.2

COPY Gemfile Gemfile.lock ./

RUN bundle config --local build.sassc --disable-march-tune-native
RUN bundle install --jobs 20 --retry 5

ENV RAILS_ROOT /var/www/blog
WORKDIR $RAILS_ROOT
COPY . $RAILS_ROOT
EXPOSE 3000

CMD bundle exec rake db:migrate && bundle exec puma -C config/puma.rb