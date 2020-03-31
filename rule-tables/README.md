### Before

```ruby
def device_type(device)
  if device.os =~ /ios/i
    if device.resolution.width > 1024 &&
       device.resolution.height > 768
      :ios_hi
    else
      :ios_lo
    end
  elsif device.os =~ /android/i
    if device.resolution.width >= 1280 &&
       device.resolution.height > 800
      if device.user_agent_misc =~ /inky/i
        :ereader
      else
        :android_hi
      end
    else
      :android_lo
    end
  else
    :unknown
  end
end
```

### After

```ruby
TABLE = RuleTable.new
TABLE.add_rule_for :ios_hi, MatchOs.new(/ios/i),
                            MatchWidth.new(1024..2732),
                            MatchHeight.new(768..2048)
TABLE.add_rule_for :ios_lo, MatchOs.new(/ios/i),
                            MatchWidth.new(0...1024),
                            MatchHeight.new(0...768)
TABLE.add_rule_for :android_hi, MatchOs.new(/android/i),
                                MatchWidth.new(1280..2560),
                                MatchHeight.new(800..1800)
TABLE.add_rule_for :android_lo, MatchOs.new(/android/i),
                                MatchWidth.new(0...1280),
                                MatchHeight.new(0...800)

MatchOs = Struct.new(:pattern) do
  def matches?(device)
    pattern === device.os
  end
end

MatchWidth = Struct.new(:pattern) do
  def matches?(device)
    pattern === device.resolution.width
  end
end

MatchHeight = Struct.new(:pattern) do
  def matches?(device)
    pattern === device.resolution.height
  end
end

MatchMisc = Struct.new(:pattern) do
  def matches?(device)
    pattern === device.user_agent_misc
  end
end
```
