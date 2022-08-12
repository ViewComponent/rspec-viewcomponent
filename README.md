# ViewComponent::RSpec

ViewComponent::Rspec provides contexts that help you write clean one-line specs
for your components. This enables you to test that they respond as expected and
specify their function without the cruft of boilerplate.

## Installation

Add this line to your application's Gemfile, ideally in the `test` group:

```ruby
gem 'viewcomponent-rspec'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install viewcomponent-rspec

## Usage

Require the gem in your `spec_helper.rb`:

`require 'viewcomponent-rspec'`

Make the shared context available to component examples:

```
RSpec.configure do |config|
  config.include ViewComponent::RSpec::Context, type: :component
end
```

Then, in each of your component specs, `include_context 'ViewComponent'`.

It's suggested that you follow the patterns laid out in
`spec/viewcomponent/rspec/context_spec.rb` when testing your component.
Generally, you'll only need to test the rendered component unless you're reliant
on methods you call upon it. `ViewComponent::RSpec::Context` makes this
available as the `subject` of any tests by default, allowing you to write
one-line tests with matchers like `have_css` and `be_empty`:

```ruby
describe ExampleComponent do
  let(:args) { ['red'] }
  let(:content) { ->(_view_context = nil) { 'Hello World' } }

  describe 'rendered component' do
    it { is_expected.to have_css('p.red', text: 'Hello World') }

    context 'with nil content' do
      let(:content) { ->(view_context = nil) {} }

      it { is_expected.to be_empty }
    end
  end
end
```

As you can see there, the context also makes use of two variables defined with `let`:

- `args`, passed to the component upon initialize, e.g. `'red'` in the case of
  `ExampleComponent.new('red')`.
- `content`, passed to the component in a block when it's rendered, e.g.
  `ExampleComponent.new.with_content('Hello World')` or

  ```erb
  <%= render ExampleComponent do %>
    Hello World
  <% end %>
  ```

`component_instance` is also available, should you wish to test against the
component instance itself.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/boardfish/viewcomponent-rspec. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [code of
conduct](https://github.com/boardfish/viewcomponent-rspec/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ViewComponent::RSpec project's codebases, issue
trackers, chat rooms and mailing lists is expected to follow the [code of
conduct](https://github.com/boardfish/viewcomponent-rspec/blob/main/CODE_OF_CONDUCT.md).
