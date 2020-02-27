class NullObject
  def method_missing(*args, &block)
    self
  end
end

def Maybe(value)
  case value
  when nil then NullObject.new
  else value
  end
end

p NullObject.new.foobar.baz.buz

p Maybe(nil).foo.bar
