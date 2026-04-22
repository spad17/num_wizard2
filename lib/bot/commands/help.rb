# lib/bot/commands/help.rb
module NumWizardBot
  module Commands
    class Help
      def self.call(_args)
        <<~HELP
          🧙 *NumWizard Bot v1.0*

          📋 *Команды:*
          `/prime <n>` — проверка на простоту
          `/factorial <n>` — факториал (0..100)
          `/fib <n>` — число Фибоначчи
          `/sieve <n>` — простые до n
          `/lasvegas [bits]` — поиск простого (4..20 бит)
          `/help` — справка

          💡 *Примеры:*
          `/prime 97`
          `/factorial 20`
          `/fib 15`
          `/lasvegas 16`

          👤 @spad17 | num_wizard2 gem
        HELP
      end
    end
  end
end