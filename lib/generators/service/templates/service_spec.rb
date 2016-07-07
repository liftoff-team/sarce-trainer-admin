require "rails_helper"

RSpec.describe {ServiceName}Service do
  let(:{model_name}) { build_stubbed(:{model_name}) }
  subject { described_class.new({model_name}: {model_name}) }
  before { allow(described_class).to receive(:new).and_call_original }

  describe "#say_hello" do
    let(:name) { "Chuck" }
    before { @result = subject.say_hello(name) }
    it { expect(@result).to eq("Hello, Chuck from {ServiceName}Service!") }
  end

end