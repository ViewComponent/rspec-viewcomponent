class ExampleComponent < ViewComponent::Base
  attr_reader :color, :aargs, :kwargs

  def initialize(color, *aargs, **kwargs)
    @color = color
    @aargs = aargs
    @kwargs = kwargs
  end

  def call
    tag.p(class: color) { content }
  end

  def render?
    content
  end
end
