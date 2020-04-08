class Bird
end

class FlyingBird < Bird
end

class Pigeon < Bird
end

class Cardinal < Bird
end

class Penguin < Bird
  def fly
    raise 'Can not fly'
  end
end

def migrate_south(birds)
  birds.each do |bird|
    bird.fly
  end
end
