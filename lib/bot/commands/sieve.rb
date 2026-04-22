module NumWizardBot
  module Commands
    class Sieve
      MAX_LIMIT = 1000

      def self.call(args)
        unless args&.match?(/^\d+$/)
          return <<~MSG
            📋 <b>Решето Эратосфена</b>
            
            Использование: /sieve &lt;число 2..#{MAX_LIMIT}&gt;
            Пример: /sieve 30
            
            💡 Находит все простые числа до N
          MSG
        end

        limit = args.to_i
        return "⚠️ Введите число от 2 до #{MAX_LIMIT}" if limit < 2 || limit > MAX_LIMIT

        primes = NumWizard2.sieve(limit)
        count = primes.length

        if count > 50
          preview = primes.first(25).join(", ") + ", ..., " + primes.last(15).join(", ")
          <<~MSG
            📋 <b>Простые числа до #{limit}</b>
            
            📊 Найдено: <b>#{count}</b> чисел
            
            🔢 <code>#{preview}</code>
            
            <i>Показаны первые 25 и последние 15</i>
          MSG
        else
          list = primes.join(", ")
          <<~MSG
            📋 <b>Простые числа до #{limit}</b>
            
            📊 Найдено: <b>#{count}</b> чисел
            
            🔢 <code>#{list}</code>
          MSG
        end
      end
    end
  end
end