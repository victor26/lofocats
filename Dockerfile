FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /lofocats_ui
COPY Gemfile /lofocats_ui/Gemfile
COPY Gemfile.lock /lofocats_ui/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 80 

CMD ["bundle", "exec", "rails", "s", "-p", "80", "-b", "0.0.0.0"]
