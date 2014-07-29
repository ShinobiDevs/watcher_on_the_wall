require 'redis'
require "watcher_on_the_wall/version"

module WatcherOnTheWall

  def self.included(base)
    base.class_eval do
      include InstanceMethods
    end

  end

  module Exceptions

    class AlreadyRunning < RuntimeError; end
  end

  module InstanceMethods

    def watcher_on_the_wall(options = {}, &block)
      configuration = {
        unique_key: (0..60).map { ('a'..'z').to_a[rand(26)] }.join,
        auto_expire_in_seconds: 300
      }.merge(options)

      key = configuration[:unique_key]
      expire_in = configuration[:auto_expire_in_seconds].to_i

      self.watch(key)
      if self.exists(key) == true
        raise Exceptions::AlreadyRunning
      end
      self.multi do
        self.setex(key, expire_in, true)
      end

      begin
        yield if block_given?
      ensure
        self.del(key)
      end
    end
  end

end

Redis.send(:include, WatcherOnTheWall)
