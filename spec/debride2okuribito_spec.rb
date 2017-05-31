require "spec_helper"
require "debride2okuribito"

describe DebrideToOkuribito do
  describe "#convert_yaml" do
    let(:args) { ["spec/support/test_target"] }
    let(:converter) { DebrideToOkuribito::Converter.new args }

    before do
      allow(converter).to receive(:read_debride)
      allow(converter).to receive(:write_yaml)
      converter.convert_yaml
    end

    it { expect(converter).to have_received(:read_debride) }
    it { expect(converter).to have_received(:write_yaml) }
  end

  describe "#read_debride" do
    let(:args) { ["spec/support/test_target"] }
    let(:converter) { DebrideToOkuribito::Converter.new args }
    let(:ret) { { "TestTarget" => ["#deprecated_method", ".deprecated_self_method"] } }

    subject { converter.read_debride }

    it { is_expected.to eq ret }
  end

  describe "#write_yaml" do
    let(:args) { { "TestTarget" => ["#deprecated_method", ".deprecated_self_method"] } }
    let(:converter) { DebrideToOkuribito::Converter.new args }
    let(:expect_obj) { "TestTarget:\n  - \"#deprecated_method\"\n  - \".deprecated_self_method\"\n" }
    let(:expect_filename) { "okuribito.yml" }

    before do
      allow(converter).to receive(:generate_file)
      converter.write_yaml(args)
    end

    it { expect(converter).to have_received(:generate_file).with(expect_obj, expect_filename) }
  end
end
