require 'net/http'
require 'json'

module RequestLogger
  def log_request(service, url, method = :get)
    puts "[#{service}] #{method.upcase} #{url}"
  end
end

class RequestHandler
  ResponseError = Class.new(StandardError)

  def send_request(url, method = :get)
    response = Net::HTTP.get_response(URI(url))
    raise ResponseError if response.code != '200'

    JSON.parse(response.body)
  end
end

class ResponseProcessor
  def process(response, entity, mapping = {})
    return entity.new(map(response, mapping)) if response.is_a?(Hash)

    if response.is_a?(Array)
      response.map { |h| entity.new(map(h, mapping)) if h.is_a?(Hash) }
    end
  end

  def map(params, mapping = {})
    return params if mapping.empty?

    params.each_with_object({}) do |(k, v), hash|
      hash[mapping[k] ? mapping[k] : k] = v
    end
  end
end

class BlogServiceConfig
  def initialize(env:)
    @env = env
  end

  def base_url
    return 'https://prod.myserver.com' if @env == 'production'

    'https://jsonplaceholder.typicode.com'
  end
end

class BlogService
  include RequestLogger

  def initialize(environment = 'development')
    @env = environment
  end

  def posts
    url = "#{config.base_url}/posts"

    log_request('BlogService', url)
    posts = request_handler.send_request(url)
    response_processor.process(posts, Post, mapping)
  end

  private

  attr_reader :env

  def config
    @config ||= BlogServiceConfig.new(env: @env)
  end

  def request_handler
    @request_handler ||= RequestHandler.new
  end

  def response_processor
    @response_processor ||= ResponseProcessor.new
  end

  def mapping
    { 'id' => :id, 'userId' => :user_id, 'body' => :body, 'title' => :title }
  end
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
