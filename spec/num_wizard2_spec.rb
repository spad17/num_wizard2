# spec/num_wizard_spec.rb
require "num_wizard2"
require "rspec"

RSpec.describe NumWizard2 do
  describe ".prime?" do
    it "checks small primes" do
      expect(NumWizard2.prime?(2)).to be true
      expect(NumWizard2.prime?(17)).to be true
      expect(NumWizard2.prime?(4)).to be false
    end
  end

  describe ".sieve" do
    it "returns primes up to limit" do
      expect(NumWizard2.sieve(10)).to eq([2, 3, 5, 7])
    end
  end

  describe ".fermat_prime?" do
    it "detects composites" do
      expect(NumWizard2.fermat_prime?(100)).to be false
      expect(NumWizard2.fermat_prime?(91)).to be false
    end
    it "likely detects primes" do
      expect(NumWizard2.fermat_prime?(97)).to be true
    end
  end

  describe ".factorial" do
    it "computes correctly" do
      expect(NumWizard2.factorial(0)).to eq(1)
      expect(NumWizard2.factorial(5)).to eq(120)
    end
    it "raises on negative" do
      expect { NumWizard2.factorial(-1) }.to raise_error(ArgumentError)
    end
  end

  describe ".profile_factorial" do
    it "returns profiling hash" do
      result = NumWizard2.profile_factorial(10)
      expect(result[:result]).to eq(3_628_800)
      expect(result[:time_ms]).to be_a(Numeric)
      expect(result[:digits]).to eq(7)
    end
  end

  describe ".fibonacci" do
    it "uses iterative tuple assignment" do
      expect(NumWizard2.fibonacci(0)).to eq(0)
      expect(NumWizard2.fibonacci(10)).to eq(55)
      expect(NumWizard2.fibonacci(20)).to eq(6_765)
    end
  end

  describe ".oeis_info" do
    it "returns OEIS links" do
      info = NumWizard2.oeis_info(:fibonacci)
      expect(info[:id]).to eq("A000045")
      expect(info[:url]).to include("oeis.org")
    end
  end
end