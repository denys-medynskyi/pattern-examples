### Definition

Software should be open for extension, but closed for modification.

We should be able to extend functionality without changing the code.

We can achieve this by:

- inheritance
- composition
- dependency injection
- decorator pattern
- strategy pattern

### Example 1: notification sender

#### bad: If we would like to send slack message instead of email?

```ruby
class NotificationSender
  def send(user, message)
    EmailSender.send(user, message)
  end
end
```

#### good: With dependency injection it is possible to change sender.

```ruby
class NotificationSender
  def send(user, message, sender = EmailSender)
    sender.send(user, message)
  end
end
```

### Example 2: parser

#### bad: to add new format we need to modify def parse

```ruby
class FileParser
  def parse
    case @client.usage_file_format
      when :xml
        parse_xml
      when :csv
        parse_xml
    end
  end
end
```

#### good

```ruby
class FileParser
  def initialize(client, parser)
    @client = client
    @parser = parser
  end

  def parse(usage_file)
    @parser.parse(usage_file)
  end
end

class XmlParser
  def parse(usage_file)
  end
end

class CsvParser
end
```

### Exampe 3: reports

```ruby
class Report
  def prepare_data
    raise NotImplementedError
  end

  def write_to_file
    raise NotImplementedError
  end

  def call
    prepare_data
    write_to_file
  end
end

class PdfReport
  def prepare_data
  end
end

class XlsReprot
  def prepare_data
  end
end
```
