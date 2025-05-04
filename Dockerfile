FROM ruby:3.2

# 必要パッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    yarn \
    git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

# Gemfileを先にコピーしてbundle installを実行（キャッシュを効かせる）
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install && \
    rm -rf ~/.bundle/ /usr/local/bundle/cache /usr/local/bundle/ruby/*/bundler/gems/*/.git

# アプリの全体をコピー
COPY . .

# ✅ アセットのプリコンパイル（重要！）
RUN RAILS_ENV=production bundle exec rake assets:precompile

# ポート指定
EXPOSE 3000

# 起動コマンド（本番モードで起動）
CMD ["rails", "server", "-e", "production", "-b", "0.0.0.0"]
