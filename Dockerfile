FROM docker.io/jekyll/jekyll:stable
ADD Gemfile .
ADD Gemfile.lock .

RUN mkdir -p /usr/local/bundle && chown -R 1000 /usr/local/bundle
USER 1000
RUN bundler config set --local path /usr/local/bundle
RUN bundler install --no-cache
