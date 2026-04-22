module NumWizardBot
  module Commands
    class LasVegas
      def self.call(args)
        bits = if args&.match?(/^\d+$/)
                 args.to_i
               else
                 8
               end
        
        # Ограничиваем 4..16 бит
        bits = [[bits, 4].max, 16].min

        begin
          result = NumWizard2.find_prime_lasvegas(bits, 500)

          unless result.is_a?(Hash)
            return "❌ <b>Ошибка</b>\n\nНекорректный ответ"
          end

          if result[:error]
            return <<~MSG
              ❌ <b>Ошибка</b>
              
              #{result[:error]}
              
              💡 Попробуйте 4-12 бит
            MSG
          end

          <<~MSG
            🎲 <b>Las Vegas Algorithm</b>
            
            🔍 Поиск простого числа
            
            📊 <b>Результат:</b>
            🔢 <b>#{result[:prime]}</b>
            
            📏 Бит: #{result[:bits]}
            🔁 Попыток: #{result[:it]}
            
            <i>Вероятностный алгоритм</i>
          MSG
          
        rescue => e
          <<~MSG
            ❌ <b>Ошибка</b>
            
            #{e.class}: #{e.message}
            
            💡 Попробуйте 4-12 бит
          MSG
        end
      end
    end
  end
end