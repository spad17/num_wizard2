# lib/bot/commands/lasvegas.rb
module NumWizardBot
  module Commands
    class LasVegas
      def self.call(args)
        bits = args&.match?(/^\d+$/) ? args.to_i : 8
        bits = [[bits, 4].max, 20].min  # Ограничим 4..20 бит для демо

        result = NumWizard2.find_prime_lasvegas(min_bits: bits, maxit: 500)

        if result[:error]
          return "❌ #{result[:error]}"
        end

        <<~MSG
          🎲 *Las Vegas: найдено простое*
          🔢 #{result[:prime]}
          📏 #{result[:bits]} бит
          🔁 Попыток: #{result[:it]}
        MSG
      end
    end
  end
end