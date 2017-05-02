require "spec_helper"

RSpec.describe Fluent::Plugin::Filter::Timestamp do
  it "has a version number" do
    expect(Fluent::Plugin::Filter::Timestamp::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
