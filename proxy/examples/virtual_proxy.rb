# Creates an expensive object on demand
class TextDocument
  def load
    images.each(&:load)
  end

  def render
    images.each(&:render)
  end
end

doc = TextDocument.new
doc.images.push(Image.new)
doc.load

# class LazyLoadImage
#   attr_reader :image

#   def load
#   end

#   def render
#     image.load
#     image.render
#   end
# end

doc = TextDocument.new
doc.images.push(LazyLoadImage.new)
doc.load
