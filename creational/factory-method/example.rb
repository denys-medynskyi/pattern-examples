require 'json'
# 1st iteration
class ReportGenerator
  def self.generate(data, type)
    if type == 'csv'
      # do csv
      result = data.keys.join(",") + "\n"
      result += data.values.join(",") + "\n"
    elsif type == 'json'
      # do json
      data.to_json
    end
  end
end

# 2nd iteration
class Formatter
  def format
    fail NotImplementedError
  end
end

class CSVFormatter < Formatter
  def format(data)
    result = data.keys.join(",") + "\n"
    result += data.values.join(",") + "\n"
  end
end

class JSONFormatter < Formatter
  def format(data)
    data.to_json
  end
end

<<<<<<< Updated upstream
class ReportGenerator
  def self.generate(data, type)
    if type == 'csv'
      CSVFormatter.new.format(data)
    elsif type == 'json'
      JSONFormatter.new.format(data)
    end
=======
  def summary
    puts "Cake with #{cake.ingredient} is baked"
>>>>>>> Stashed changes
  end
end

# 3rd iteration
class FormatterFactory
  def self.for(type)
    case type
    when 'csv'
      CSVFormatter.new
    when 'json'
      JSONFormatter.new
    else
      fail 'Unsupported type'
    end
  end
end

class ReportGenerator
  def self.generate(data, type)
    FormatterFactory.for(type).format(data)
  end
end

report_data = { foo_key: "foo", bar_key: "bar", baz_key: "baz" }
puts ReportGenerator.generate(report_data, 'csv')
puts ReportGenerator.generate(report_data, 'json')
