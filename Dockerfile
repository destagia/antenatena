FROM rails

MAINTAINER Shohei Miyahita <shohei.miyashita.212@gmail.com>

ADD . /root
WORKDIR /root

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails" ,"s", "-e", "production"]