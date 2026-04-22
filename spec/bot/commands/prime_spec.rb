require "spec_helper"

RSpec.describe NumWizardBot::Commands::Prime do
  describe ".call" do
    it "returns usage for invalid input" do
      expect(described_class.call(nil)).to include("Использование")
      expect(described_class.call("abc")).to include("Использование")
    end

    it "identifies prime number" do
      result = described_class.call("17")
      expect(result).to include("✅")
      expect(result).to include("Простое")
    end

    it "identifies composite number" do
      result = described_class.call("100")
      expect(result).to include("❌")
      expect(result).to include("Составное")
    end

    it "includes Fermat test for large numbers" do
      result = described_class.call("10007")
      expect(result).to include("Тест Ферма")
    end
  end
end