class ExampleComponent < ViewComponent::Base
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def call
    tag.p(class: color) { content }
  end

  def render?
    content
  end
end
