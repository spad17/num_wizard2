module NumWizardBot
  module Commands
    class Fibonacci
      def self.call(args)
        unless args&.match?(/^\d+$/)
          return <<~MSG
            🌀 <b>Число Фибоначчи</b>
            
            Использование: /fib &lt;номер&gt;
            Пример: /fib 15
            
            💡 F(n) = F(n-1) + F(n-2)
          MSG
        end
        
        n = args.to_i
        return "⚠️ Введите число от 0 до 100" if n > 100

        value = NumWizard2.fibonacci(n)
        
        <<~MSG
          🌀 <b>F(#{n})</b> — число Фибоначчи
          
          📊 <b>Результат:</b>
          <code>#{value}</code>
          
          <i>Вычислено итеративно (кортежное присваивание)</i>
        MSG
      end
    end
  end
end