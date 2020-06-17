class Post
  attr_accessor :title

  def initialize(title)
    @title = title
  end

  def save
    PostVersion.new(self)
  end

  def restore(post_version)
    @title = post_version.title
  end
end

class PostVersion
  def initialize(post)
    @post = post.dup
  end

  def method_missing(method, *args)
    if @post.respond_to?(method)
      @post.public_send(method, *args)
    else
      super
    end
  end
end

class PostHistory
  def initialize
    @versions = {}
    @version_number = 0
  end

  def add(post)
    @versions[@version_number] = post
    @version_number += 1
  end

  def version(version_number)
    @versions[version_number]
  end
end

post = Post.new('First title')
history = PostHistory.new
history.add(post.save)
puts 'Initial State'
puts post.title
puts '-'*10
#
post.title = 'Second title'
history.add(post.save)
puts 'Changed State'
puts post.title
puts '-'*10
#
post.restore(history.version(0))
puts 'Restored State'
puts post.title
puts '-'*10
