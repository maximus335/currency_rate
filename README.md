# Currency rate

## Setting up

### Tech brief
* [Ruby](https://www.ruby-lang.org/en/news/2019/04/17/ruby-2-6-3-released/) 2.6.3
* [Rails](https://rubyonrails.org/) 6.0.3
* Using PostgreSQL([gem_pg](https://github.com/ged/ruby-pg))
* [Sidekiq](https://github.com/mperham/sidekiq) for background workers

## Development

1. Install Prerequisites
```
$ brew install postgresql imagemagick redis-server # OSX
$ apt-get install postgresql imagemagick redis-server # Ubuntu
Before the next steps, configure your config/database.yml, config/settings.yml, .env as necessary.
```
2. Install Gems
```
$ bundle install
```
3. Create and seed the database
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

4. Run background jobs and server
```
bundle exec foreman start
```

## Testing
* Unit tests
```
bundle exec rspec
```
