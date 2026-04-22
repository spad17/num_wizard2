# lib/bot/commands/sieve.rb
module NumWizardBot
  module Commands
    class Sieve
      MAX_LIMIT = 1000  # Ограничим, чтобы не спамить в чат

      def self.call(args)
        return "Использование: `/sieve <число 2..#{MAX_LIMIT}>`" unless args&.match?(/^\d+$/)

        limit = args.to_i
        return "⚠️ Введите число от 2 до #{MAX_LIMIT}" if limit < 2 || limit > MAX_LIMIT

        primes = NumWizard2.sieve(limit)
        count = primes.length

        # Если чисел много — покажем первые 20 и последние 10
        if count > 30
          preview = primes.first(20).join(", ") + ", ..., " + primes.last(10).join(", ")
          "🔢 *Простые до #{limit}*\n📊 Всего: #{count}\n\n#{preview}"
        else
          list = primes.join(", ")
          "🔢 *Простые до #{limit}*\n📊 Всего: #{count}\n\n`#{list}`"
        end
      end
    end
  end
end