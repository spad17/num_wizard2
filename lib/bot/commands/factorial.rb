module NumWizardBot
  module Commands
    class Factorial
      def self.call(args)
        unless args&.match?(/^\d+$/)
          return <<~MSG
            🔢 <b>Факториал числа</b>
            
            Использование: /factorial &lt;число&gt;
            Пример: /factorial 10
            
            💡 n! = 1 × 2 × 3 × ... × n
          MSG
        end
        
        n = args.to_i
        return "⚠️ Число должно быть от 0 до 100" if n > 100

        result = NumWizard2.factorial(n)
        profile = NumWizard2.profile_factorial(n)

        <<~MSG
          🔢 <b>#{n}!</b> (факториал)
          
          📊 <b>Результат:</b>
          <code>#{result}</code>
          
          ⏱ Время: #{profile[:time_ms]} мс
          📏 Цифр: #{profile[:digits]}
          
          <i>Вычислено с профилированием времени</i>
        MSG
      end
    end
  end
end