module NumWizardBot
  module Commands
    class Help
      def self.call(_args)
        <<~HELP
          🧙‍️ <b>NumWizard Bot v1.0</b>
          <i>Математический помощник</i>
          
          👤 Автор: @spad17 
          💎 Гем: num_wizard2
          
          ━━━━━━━━━━━━━━
          
          📋 <b>КОМАНДЫ:</b>
          
          🔹 /prime &lt;n&gt; — проверка на простоту
          🔹 /factorial &lt;n&gt; — факториал (0..100)
          🔹 /fib &lt;n&gt; — число Фибоначчи
          🔹 /sieve &lt;n&gt; — простые до n (решето)
          🔹 /lasvegas [bits] — поиск простого
          🔹 /help — эта справка
          
          ━━━━━━━━━━━━━━
          
          💡 <b>ПРИМЕРЫ:</b>
          /prime 97
          /factorial 20
          /fib 15
          /sieve 30
          /lasvegas 16
          
          ━━━━━━━━━━━━━━
          
          <i>Все команды работают с гемом num_wizard2</i>
        HELP
      end
    end
  end
end