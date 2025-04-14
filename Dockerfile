# ベースイメージとして Ruby を指定
FROM ruby:3.2

# 必要なパッケージをインストール（build-essential がコンパイルツール一式を含む）
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    yarn \
    git \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを作成
WORKDIR /myapp

# Gemfile と Gemfile.lock をコピー
COPY Gemfile Gemfile.lock ./

# bundler をインストール
RUN gem install bundler

# gem をインストール
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# アプリケーションのソースコードをコピー
COPY . .

# ポートを開放（例：3000）
EXPOSE 3000

# サーバー起動コマンド（適宜変更可能）
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
