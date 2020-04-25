# My Service

Welcome to your new Hanami project!

## Setup

How to run tests:

```shell
% docker-compose run --rm rpsec
```

How to run the development console:

```shell
% docker-compose run --rm bundle exec hanami console
```

How to run the development server:

```shell
% docker-compose up -d
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```shell
% docker-compose run -e HANAMI_ENV=test --rm bundle exec hanami db prepare
```

Explore Hanami [guides](https://guides.hanamirb.org/), [API docs](http://docs.hanamirb.org/1.3.3/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
