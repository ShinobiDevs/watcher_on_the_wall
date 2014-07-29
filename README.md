# WatcherOnTheWall

WatcherOnTheWall aims to provide a single instance mutual exclusion lock for running ruby scripts

## Installation

Add this line to your application's Gemfile:

    gem 'watcher_on_the_wall'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install watcher_on_the_wall

## Usage

`WatcherOnTheWall` will automatically hook onto your existing Redis instance, so in order to use that you'll just need to use the following method

```ruby
    redis = Redis.new # Or whatever

    redis.watcher_on_the_wall(unique_key: "my_script_is_running_now", auto_expire_in_seconds: 300) do
      # I am a script that does things but i can't be started again until i'm done.
    end
```
### Options

* `unique_key` - this will be used as a Redis key to and will be checked and locked accordingly by the running scripts. defaults to a random 60 chars long string.
* `auto_expire_in_seconds` - specifiy the number of seconds to auto-expire the mutex key to ensure it is not helf forever if something happens, if you specify `false` no expiry interval will be set (not recommended). defaults to 300 seconds (5 minutes).

The lock and key will be released and deleted once the run is over.

## Exceptions

If you will try to run a script that uses the same `unique_key` while one is still running, `WatcherOnTheWall` will raise an `WatcherOnTheWall::Exceptions::AlreadyRunning` exception.
## Contributing

1. Fork it ( http://github.com/<my-github-username>/watcher_on_the_wall/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
