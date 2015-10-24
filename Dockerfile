FROM rails

MAINTAINER Shohei Miyahita <shohei.miyashita.212@gmail.com>

ADD . /root
WORKDIR /root

RUN bundle install
ENV SECRET_KEY_BASE  6dde6b4e8fab74339a24135fad825016ab271a157e936ce14fe3f40f2e8fb1d5008c63d32714b4a7e7b7f0219a2f92a28ab9c31cde484ff80b1429be586ef2ec

EXPOSE 3000

CMD ["bundle", "exec", "rails" ,"s", "-e", "production"]