module NumWizardBot
  module Commands
    class Prime
      def self.call(args)
        unless args&.match?(/^\d+$/)
          return <<~MSG
            🔍 <b>Проверка на простоту</b>
            
            Использование: /prime &lt;число&gt;
            Пример: /prime 17
            
            💡 Простое число делится только на 1 и само на себя
          MSG
        end

        n = args.to_i
        return "⚠️ Введите число больше 0" if n <= 0

        is_prime = NumWizard2.prime?(n)
        
        if n > 10_000
          fermat = NumWizard2.fermat_prime?(n)
          return <<~MSG
            🔢 <b>#{n}</b>
            
            #{is_prime ? '✅' : '❌'} #{is_prime ? 'Простое число' : 'Составное число'}
            🎲 Тест Ферма: #{fermat ? 'прошёл' : 'не прошёл'}
            
            <i>Для больших чисел используется вероятностный тест</i>
          MSG
        end

        <<~MSG
          🔢 <b>#{n}</b>
          
          #{is_prime ? '✅' : '❌'} #{is_prime ? 'Простое число' : 'Составное число'}
          
          #{is_prime ? '🎯 Делится только на 1 и ' + n.to_s : '📊 Имеет другие делители'}
        MSG
      end
    end
  end
end