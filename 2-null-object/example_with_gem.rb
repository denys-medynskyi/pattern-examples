# gem install nullobject

require 'nullobject'

p Null::Object.instance.foobar.baz.buz

class FooNullObject
  include Null

  def to_bar
    "nothing here"
  end
end

foo = FooNullObject.instance
p foo.to_bar
p foo.abc
