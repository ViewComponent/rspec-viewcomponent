module RSpec
  module ViewComponent
    module Context
      RSpec.shared_context 'ViewComponent' do
        subject do
          render_inline component, &content
          rendered_component
        end

        let(:component) { described_class.new(*args) }
        let(:content) { ->(_view_context = nil) {} }
        let(:component_instance) do
          rendered_content = content.call
          rendered_content ? component.with_content(rendered_content) : component
        end

        matcher :be_rendered do
          match do |actual|
            expect(actual).to be_render
          end
        end
      end
    end
  end
end
