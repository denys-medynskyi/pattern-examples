# Context
class Post
  attr_accessor :state
  attr_reader :content

  def initialize(content)
    @content = content
    @state = Draft.new(self)
  end

  def next_state
    state.next_state
  end

  def humanize_state
    state.class.name
  end

  def show_content
    if state.published?
      content
    else
      "Content is not published. Status = #{humanize_state}"
    end
  end
end

# State
class State
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def published?
    fail NotImplementedError
  end

  def next_state
    fail NotImplementedError
  end
end

# Concrete States
class Draft < State
  def published?
    false
  end

  def next_state
    post.state = Published.new(post)
  end
end

class Published < State
  def published?
    true
  end
end

# printing

post = Post.new('I am content')
p post.humanize_state
p post.show_content
post.next_state
p post.humanize_state
p post.show_content
