# lib/bot/commands/factorial.rb
module NumWizardBot
  module Commands
    class Factorial
      def self.call(args)
        return "Использование: `/factorial <0..100>`" unless args&.match?(/^\d+$/)
        n = args.to_i
        return "⚠️ Число должно быть от 0 до 100" if n > 100

        result = NumWizard2.factorial(n)
        profile = NumWizard2.profile_factorial(n)

        "🔢 *#{n}!* = `#{result}`\n⏱ #{profile[:time_ms]} мс | 📊 #{profile[:digits]} цифр"
      end
    end
  end
end