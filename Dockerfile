FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /lofocats_ui
COPY Gemfile /lofocats_ui/Gemfile
COPY Gemfile.lock /lofocats_ui/Gemfile.lock
RUN bundle install


