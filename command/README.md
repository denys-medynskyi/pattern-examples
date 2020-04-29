### Definition

Encapsulates request as an object, so letting you parameterize your clients with different requests, queue or log requests with optional undo functionality.

`Command` provides a way to decouple an action (`command`) from when and where it is sent.

Allows you to:
- do action
- undo action
- store history of

`Command` is passed to the invoker to be executed later.

### Links

- https://en.wikipedia.org/wiki/Command_pattern#Ruby
- https://bogdanvlviv.com/posts/ruby/patterns/design-patterns-in-ruby.html#command

### Code examples

```ruby
class LightSwitch
  def initialize(command)
    @command = command
  end

  def turn_on
    @command.execute
  end

  def turn_off
    @command.undo
  end
end
```

```ruby
class AddItemToCartCommand
  def initialize(item, cart)
    @item = item
    @cart = cart
  end

  def execute
    @cart.add_item(@item)
  end

  def unexecute
    @cart.remove_item(@item)
  end
end
```

### In screening

- claim / unclaim
- approve / discard
