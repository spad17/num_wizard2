# lib/bot/commands/fibonacci.rb
module NumWizardBot
  module Commands
    class Fibonacci
      def self.call(args)
        return "Использование: `/fib <0..100>`" unless args&.match?(/^\d+$/)
        n = args.to_i
        return "⚠️ Введите число от 0 до 100" if n > 100

        value = NumWizard2.fibonacci(n)
        "🌀 *F(#{n})* = `#{value}`"
      end
    end
  end
end