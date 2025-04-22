FROM ruby:3.2

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    yarn \
    git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install && \
    rm -rf ~/.bundle/ /usr/local/bundle/cache /usr/local/bundle/ruby/*/bundler/gems/*/.git

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
