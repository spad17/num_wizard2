
require "dotenv/load"
require_relative "bot/bot"

token = ENV["TELEGRAM_BOT_TOKEN"]
unless token
  puts "❌ Не задан TELEGRAM_BOT_TOKEN"
  puts "💡 Скопируй .env.example в .env и вставь токен от @BotFather"
  exit 1
end

puts "🤖 NumWizard Bot запущен..."

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    next unless message.chat.type == "private"

    response = NumWizardBot::Bot.handle(message.text)
    bot.api.send_message(chat_id: message.chat.id, text: response, parse_mode: "Markdown")
  end
end