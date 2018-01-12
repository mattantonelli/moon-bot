#!/usr/bin/env ruby

require 'discordrb'
require 'json'
require 'ostruct'
require 'rest-client'
require 'yaml'

require_relative 'moon.rb'

CONFIG = OpenStruct.new(YAML.load_file('config.yml'))

moon = Moon.new
phase = Proc.new { |message| message.content[1..-1] if message.content.start_with?(moon.current_phase) }

bot = Discordrb::Commands::CommandBot.new(token: CONFIG.token, client_id: CONFIG.client_id,
                                          prefix: phase, spaces_allowed: true)

bot.command(:neil) do |event|
  event.respond 'Armstrong!'
end

puts "Current phase: #{moon.current_phase}"
bot.run
