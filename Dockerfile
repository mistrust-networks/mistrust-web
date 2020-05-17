FROM jekyll/jekyll:stable
ADD Gemfile .
ADD Gemfile.lock .

RUN bundler install --no-cache
