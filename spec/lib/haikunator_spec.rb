require_relative "../spec_helper"
require "securerandom"

describe Haikunator do # rubocop:disable Metrics/BlockLength
  let(:id) { SecureRandom.uuid }
  let(:other_id) { SecureRandom.uuid }

  it "generates a name like still-silence-5012" do
    name = Haikunator.haikunate(id)

    expect(name).to match(/\A\w+-\w+-\d{1,4}\z/)
  end

  it "returns different names for subsequent calls" do
    name1 = Haikunator.haikunate(id)
    name2 = Haikunator.haikunate(other_id)

    expect(name1).not_to eq name2
  end

  it "returns the same name for the same argument" do
    name = -> { Haikunator.haikunate(id) }
    expect(name.call).to eq name.call
  end

  it "permits optional configuration of the token range" do
    name = Haikunator.haikunate(id, 9)

    expect(name).to match(/-\d{1}\z/)
  end

  it "drops the token if token range is 0" do
    name = Haikunator.haikunate(id, 0)

    expect(name).to match(/\A\w+-\w+\z/)
  end

  it "permits optional configuration of the delimiter" do
    name = Haikunator.haikunate(id, 9999, ".")

    expect(name).to match(/\A\w+\.\w+\.\d{1,4}\z/)
  end

  it "drops the token and delimiter if token range is 0 and delimiter empty space" do
    name = Haikunator.haikunate(id, 0, " ")

    expect(name).to match(/\A\w+ \w+\z/)
  end
end
