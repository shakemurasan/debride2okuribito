require "spec_helper"

describe DebrideToOkuribito do
  let(:converter) { DebrideToOkuribito::Converter.new }

  before do
    allow(converter).to receive(:generate_file)
  end

  describe "#convert_yaml" do
    before do
      allow(converter).to receive(:read_debride)
      allow(converter).to receive(:write_yaml)
      converter.convert_yaml(["spec/support/test_target"])
    end

    it { expect(converter).to have_received(:read_debride) }
    it { expect(converter).to have_received(:write_yaml) }
  end

  describe "#read_debride" do
    let(:ret_hash) { { "TestTarget" => ["#deprecated_method", ".deprecated_self_method"] } }

    subject { converter.read_debride(["spec/support/test_target"]) }

    it { is_expected.to eq ret_hash }
  end
end
