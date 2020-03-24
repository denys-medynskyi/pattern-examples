require 'net/http'
require 'json'

class BlogService
  def initialize(environment = 'development')
    @env = environment
  end

  def posts
    url = 'https://jsonplaceholder.typicode.com/posts'
    url = 'https://prod.myserver.com' if env == 'production'

    puts "[BlogService] GET #{url}"
    response = Net::HTTP.get_response(URI(url))

    return [] if response.code != '200'

    posts = JSON.parse(response.body)
    posts.map do |params|
      Post.new(
        id: params['id'],
        user_id: params['userId'],
        body: params['body'],
        title: params['title']
      )
    end
  end

  private

  attr_reader :env
end

class Post
  attr_reader :id, :user_id, :body, :title

  def initialize(id:, user_id:, body:, title:)
    @id = id
    @user_id = user_id
    @body = body
    @title = title
  end
end
