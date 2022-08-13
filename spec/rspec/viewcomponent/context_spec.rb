# frozen_string_literal: true

require "spec_helper"

RSpec.describe RSpec::ViewComponent::Context do
  include described_class

  describe ExampleComponent, type: :component do
    let(:args) { ["red"] }
    let(:content) { ->(_view_context = nil) { "Hello World" } }

    describe "rendered component" do
      it { is_expected.to have_css("p.red", text: "Hello World") }

      context "with nil content" do
        let(:content) { ->(view_context = nil) {} }

        it { is_expected.to be_empty }
      end
    end

    describe "#initialize" do
      subject { component_instance }

      it { is_expected.to be_an ExampleComponent }
      it { is_expected.to have_attributes(color: "red") }

      context "given a bunch of args" do
        let(:args) { %w[red blue green] }
        let(:kwargs) { {other_color: "yellow"} }

        it {
          is_expected.to have_attributes(
            color: "red",
            aargs: %w[blue green],
            kwargs: {other_color: "yellow"}
          )
        }
      end
    end

    describe "#render?" do
      subject { component_instance }

      it { is_expected.to be_rendered }

      context "with nil content" do
        let(:content) { ->(view_context = nil) {} }

        it { is_expected.not_to be_rendered }
      end
    end
  end
end
