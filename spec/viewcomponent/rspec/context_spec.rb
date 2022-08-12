# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ViewComponent::RSpec::Context do
  include described_class

  describe ExampleComponent, type: :component do
    include_context 'ViewComponent'

    let(:args) { ['Hello World'] }

    describe 'rendered component' do
      it { is_expected.to have_css('p', text: 'Hello World') }

      context 'with nil arg' do
        let(:args) { [nil] }

        it { is_expected.to be_empty }
      end
    end

    describe 'component instance' do
      subject { component }

      it { is_expected.to be_an ExampleComponent }

      context 'with nil arg' do
        let(:args) { [nil] }

        it { is_expected.not_to be_rendered }
      end
    end
  end
end
