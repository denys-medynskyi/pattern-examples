class ReportGenerator
  def self.generate(data, formatter)
    formatter.format(data)
  end
end

require 'json'

class JsonFormatter
  def self.format(data)
    data.to_json
  end
end

class HTMLFormatter
  def self.format(data)
    list_li = data.map { |item| "<li>#{item}</li>" }
    "<ul>#{list_li.join}</ul>"
  end
end

data = { onions: 31, potatoes: 24, eggs: 10 }
p ReportGenerator.generate(data, JsonFormatter)
p ReportGenerator.generate(data, JsonFormatter)
