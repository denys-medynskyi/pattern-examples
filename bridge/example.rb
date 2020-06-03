# abstraction
class Shape
  def initialize(implementor)
    @implementor = implementor
  end
end
# 'refined' abstraction
class RectangleShape < Shape
  def draw
    @implementor.draw_rectangle
  end
end
# another 'refined' abstraction
class CircleShape < Shape
  def draw
    @implementor.draw_circle
  end
end

###############################################
# Bridge Implementor and concrete implementors
###############################################
# the base 'Implementor' in the Bridge
class ShapeImplementor
  def draw_circle
    raise '#draw_circle must be defined.'
  end

  def draw_rectangle
    raise '#draw_rectangle must de defined.'
  end
end
# Represents a 'concrete implementator'
class WindowsShapeImplementor < ShapeImplementor
  def draw_circle
    # Imagine code here that draws a circle.
  end

  def draw_rectangle
    # Imagine code here that draws a rectangle.
  end
end

class MacShapeImplementor < ShapeImplementor
  def draw_circle
    # Imagine code here that draws a circle.
  end

  def draw_rectangle
    # Imagine code here that draws a rectangle.
  end
end

# usage
rectangle = RectangleShape.new(MacShapeImplementor.new)
rectangle.draw

