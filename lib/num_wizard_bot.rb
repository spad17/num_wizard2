# lib/num_wizard_bot.rb
require "dotenv/load"
require "telegram/bot"
require_relative "bot/bot"

token = ENV["TELEGRAM_BOT_TOKEN"]
abort("❌ TELEGRAM_BOT_TOKEN не задан!") unless token

puts "🤖 NumWizard Bot запущен..."
puts "⏳ Ожидание сообщений..."

bot = Telegram::Bot::Client.new(token)
bot.get_updates(offset: 0, limit: 100, timeout: 0)

offset = 0

loop do
  begin
    response = bot.get_updates(offset: offset, timeout: 30)
    
    # ИСПРАВЛЕНИЕ: извлекаем массив из response
    updates = if response.is_a?(Hash)
                response["result"] || response[:result] || []
              elsif response.is_a?(Array)
                response
              else
                []
              end
    
    updates.each do |update|
      update_id = update["update_id"]
      offset = update_id.to_i + 1
      
      message = update["message"]
      next unless message
      
      text = message["text"]
      next unless text
      
      chat_id = message["chat"]["id"].to_i
      from_name = message["from"]["first_name"] || "Unknown"
      
      puts "💬 #{from_name}: #{text}"
      
      response_text = NumWizardBot::Bot.handle(text)
      
      bot.send_message(chat_id: chat_id,text: response_text,parse_mode: "HTML")
      
      puts "✅ Ответ отправлен"
    end
    
  rescue => e
    puts "❌ #{e.message}"
    sleep 2
  end
end