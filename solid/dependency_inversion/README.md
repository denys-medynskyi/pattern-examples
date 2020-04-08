### Definition

High-level modules should not depend on low level modules. Both should depend on abscractions.

Abstractions should not depend on details. Details should depend on abscractions.

### bad
```ruby
class UserRepository
  def all
    User.all
  end
end
```

### good
```ruby
class UserRepository
  def initialize(data_source)
    @data_source = data_source
  end

  def all
    @data_source.all
  end
end
```
