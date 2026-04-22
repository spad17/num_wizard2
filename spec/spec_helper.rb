# spec/spec_helper.rb
require "num_wizard2"
require_relative "../lib/bot/bot"  # Подключаем бота для тестов
require "rspec"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  # Цветной вывод
  config.color_mode = true
  # Порядок тестов (можно random для надёжности)
  config.order = :random
end