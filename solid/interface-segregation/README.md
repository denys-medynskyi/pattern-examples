### Definition

Clients should not be forced to depend upon interfaces that they don't use.

Many client specific interfaces are better than one general.

The dependency of one class to another should depend on the smallest possible interface.

### Step 1
```ruby
class FeeCalculator
  def calculate(fee, user, vat)
  end
end
```

### Step 2: in one case we need to send fee report

```ruby
class FeeCalculator
  def calculate(fee, user, vat, send_report = false)
    # calculate
    if send_report
    # send
    end
  end
end
```

### Step 3: make separate interface

```ruby
class FeeCalculator
  def calculate(fee, user, vat)
  end

  # a bit bad
  def calculate_and_send_report
  end

  # better separation
  def send_report
  end
end
```
