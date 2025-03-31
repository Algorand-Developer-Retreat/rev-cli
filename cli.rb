#!/usr/bin/env ruby

require 'thor'

class CLI < Thor
    desc "hello NAME", "say hello to NAME"
    def hello(name)
        puts "Hello, #{name}!"
    end
end

CLI.start(ARGV)