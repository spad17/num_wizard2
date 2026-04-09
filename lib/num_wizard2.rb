# lib/num_wizard2.rb

module NumWizard2
  VERSION = "1.0.0"

  #Простые числа: детерминированная проверка 
  def self.prime?(n)
    return false if n < 2
    return true if n == 2
    return false if n.even?
    (3..Math.sqrt(n).to_i).step(2) { |i| return false if n % i == 0 }
    true
  end

  #Решето Эратосфена
  def self.sieve(limit)
    return [] if limit < 2
    is_prime = Array.new(limit + 1, true)
    is_prime[0] = is_prime[1] = false
    (2..Math.sqrt(limit).to_i).each do |i|
      if is_prime[i]
        (i * i..limit).step(i) { |j| is_prime[j] = false }
      end
    end
    (2..limit).select { |i| is_prime[i] }
  end

  # Тест Ферма (вероятностный, Las Vegas)
  def self.fermat_prime?(n, iterations = 10)
    return true if n == 2 || n == 3
    return false if n < 2 || n.even?
    iterations.times do
      a = rand(2..n - 2)
      return false if mod_exp(a, n - 1, n) != 1
    end
    true
  end

  def self.find_prime_lasvegas(min_bits = 8, maxit = 1000)
    min_val = 2**min_bits
    max_val = 2**(min_bits + 5)
    it = 0
    while it < maxit
      cand = rand(min_val..max_val)
      cand |=1

      it += 1
      next unless fermat_prime?(cand, 3)
      if prime?(cand)
        return {
          prime: cand,
          it: it,
          bits: cand.to_s(2).length
        }
      end
    end
    {error: "Не найдено простое число за #{maxit} попыток"}
  end


  # Быстрое возведение в степень по модулю
  def self.mod_exp(base, exp, mod)
    result = 1
    base %= mod
    while exp > 0
      result = (result * base) % mod if exp.odd?
      exp >>= 1
      base = (base * base) % mod
    end
    result
  end

  #Факториал с профилированием (время)
  def self.factorial(n)
    raise ArgumentError, "n must be >= 0" if n < 0
    (1..n).reduce(1, :*)
  end

  def self.profile_factorial(n)
    start = Time.now
    result = factorial(n)
    time_ms = ((Time.now - start) * 1000).round(3)
    { result: result, time_ms: time_ms, digits: result.to_s.length }
  end

  #Фибоначчи итеративно (кортежное присваивание)
  def self.fibonacci(n)
    raise ArgumentError, "n must be >= 0" if n < 0
    return 0 if n == 0
    return 1 if n == 1
    a, b = 0, 1
    (2..n).each { a, b = b, a + b }  # 🔥 кортежное присваивание
    b
  end

  def self.fib_sequence(count)
    raise ArgumentError, "count must be > 0" if count <= 0
    return [0] if count == 1
    seq = [0, 1]
    (2...count).each { seq << seq[-1] + seq[-2] }
    seq
  end

  #OEIS: ссылки на последовательности
  def self.oeis_info(sequence)
    ids = {
      prime: "A000040",
      fibonacci: "A000045",
      factorial: "A000142"
    }
    id = ids[sequence.to_sym]
    return { error: "Unknown sequence" } unless id
    {
      id: id,
      url: "https://oeis.org/#{id}",
      name: sequence.to_s.capitalize
    }
  end
end