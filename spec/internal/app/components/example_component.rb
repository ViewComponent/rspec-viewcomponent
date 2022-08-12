class ExampleComponent < ViewComponent::Base
  def initialize(text)
    @text = text
  end

  def call
    tag.p { @text }
  end

  def render?
    @text
  end
end
