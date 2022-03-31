FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /lofocats_ui
COPY . /lofocats_ui
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 80 

CMD ["bundle", "exec", "rails", "s", "-p", "\$\{PORT:-3000\}", "-b", "0.0.0.0"]

