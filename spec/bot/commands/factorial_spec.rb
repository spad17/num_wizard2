require "spec_helper"

RSpec.describe NumWizardBot::Commands::Factorial do
  it "calculates factorial with profiling" do
    result = described_class.call("10")
    expect(result).to include("3628800")
    expect(result).to match(/мс/)
    expect(result).to match(/цифр/)
  end

  it "rejects too large input" do
    result = described_class.call("101")
    expect(result).to include("⚠️")
  end
end