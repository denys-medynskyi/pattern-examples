class User
  attr_reader :name
end

class NullUser
  def name
    'Guest'
  end
end
