# lib/bot/commands/prime.rb
module NumWizardBot
  module Commands
    class Prime
      def self.call(args)
        return "Использование: `/prime <число>`\nПример: `/prime 17`" unless args&.match?(/^\d+$/)

        n = args.to_i
        return "⚠️ Введите число больше 0" if n <= 0

        is_prime = NumWizard2.prime?(n)
        status = is_prime ? "✅" : "❌"

        if n > 10_000
          fermat = NumWizard2.fermat_prime?(n)
          return <<~MSG
            🔢 *#{n}*
            #{status} #{is_prime ? 'Простое' : 'Составное'}
            🎲 Тест Ферма: #{fermat ? 'прошёл' : 'не прошёл'}
          MSG
        end

        "🔢 *#{n}*\n#{status} #{is_prime ? 'Простое число' : 'Составное число'}"
      end
    end
  end
end