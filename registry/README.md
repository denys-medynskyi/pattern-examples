### Definition

the Registry pattern (sometimes called a Service Locator) is a way for classes to look up their collaborators, rather than require they instantiate their collaborators explicitly

### When

- to enable Dependency Injection with default objects
- we can pass fake objects in tests
- we can use default objects in `rails console`

### Example

```ruby
class Registry
  def self.video_mapper
    @video_mapper ||= VideoMapper.new
  end
end

class EpisodeMapper
  def initialize(gateway, options={})
    @video_mapper = options.fetch(:video_mapper) { Registry.video_mapper }
  end
  # ...
end
```

### Bad usage

If you are writing code that will eventually be distributed outside of your app, you can’t assume that the global Registry will always be present. In this case, adding attribute writers or initializer arguments to pass in collaborators (i.e. dependency injection) is a more verbose but foolproof approach.

### Links

- https://www.rubytapas.com/2014/01/27/episode-172-registry/
- https://mattbrictson.com/registry-pattern
