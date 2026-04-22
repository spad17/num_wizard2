# lib/bot/bot.rb
require "telegram/bot"
require "num_wizard2"
require_relative "commands/help"
require_relative "commands/prime"
require_relative "commands/factorial"
require_relative "commands/fibonacci"
require_relative "commands/sieve"
require_relative "commands/lasvegas"

module NumWizardBot
  class Bot
    COMMANDS = {
      "help" => Commands::Help,
      "start" => Commands::Help,
      "prime" => Commands::Prime,
      "factorial" => Commands::Factorial,
      "fib" => Commands::Fibonacci,
      "fibonacci" => Commands::Fibonacci,
      "sieve" => Commands::Sieve,
      "lasvegas" => Commands::LasVegas
    }.freeze

    def self.handle(text)
      parts = text.strip.split(" ", 2)
      cmd = parts[0].gsub("/", "").downcase
      args = parts[1]

      handler = COMMANDS[cmd]
      return "❌ Команда не найдена. Напиши /help" unless handler

      handler.call(args)
    rescue ArgumentError => e
      "⚠️ #{e.message}"
    rescue => e
      "❌ Ошибка: #{e.class} — #{e.message}"
    end
  end
end