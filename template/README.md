### Template Pattern
Defines algorithm steps in `Abstract` class which should be overridden by `Concrete` class.

### Cooking Recipe
1. Buy groceries necessary for cooking
2. Prepare ingredients
3. Cook

Let's say we want to cook a salad:

```ruby
class CookingRecipe
  def call
    buy_groceries
    prepare_ingredients
    cook
  end

  def buy_groceries
    fail NotImplementedError
  end

  def prepare_ingredients
    fail NotImplementedError
  end

  def cook
    fail NotImplementedError
  end
end
```

```ruby
class SaladRecipe < CookingRecipe
  def buy_groceries
    # cucumber, tomato, onion
  end

  def prepare_ingredients
    # cut cucumber, etc.
  end

  def cook
    # mix ingredients
  end
end
```

```ruby
class SoupRecipe < CookingRecipe
  def buy_groceries
    # buy tomatoes
    # buy bread
  end

  def prepare_ingredients
    # cut tomatoes
  end

  def cook
    # heat tomatoes
  end
end
```

```ruby
class ReportTemplate
  def call
    format_report
    send_report
  end

  def send_report
    @data
    # send via email
  end
end

class TextReport < ReportTemplate
  def format_report
    # arrange financial data into plain text report
  end
end

class HTMLReport < ReportTemplate
  def format_report
    # arrange financial data into HTML report
  end
end
```
