# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t bloggerrails .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name bloggerrails bloggerrails

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.2.2
FROM docker.io/library/ruby:$RUBY_VERSION-slim

# Install essential Linux packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    default-mysql-client \
    git \
    libjemalloc2 \
    libvips \
    pkg-config \
    default-libmysqlclient-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Rails app lives here
WORKDIR /rails

# Set development environment
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_APP_CONFIG="/usr/local/bundle" \
    BUNDLE_WITHOUT=""

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy application code
COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.dev.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.dev.sh
ENTRYPOINT ["entrypoint.dev.sh"]

# Configure the main process to run when running the image
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
