module ViewComponent
  module RSpec
    module Context
      RSpec.shared_context 'ViewComponent' do
        subject do
          render_inline component
          rendered_component
        end

        let(:component) { described_class.new(*args) }

        matcher :be_rendered do
          match do |actual|
            expect(actual).to be_render
          end
        end
      end
    end
  end
end
