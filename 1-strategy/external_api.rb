class ResponseHandler
  def self.handle(response, strategies)
    strategies[response.status.to_sym].call
  end
end

def show
  response = external_service.get(params[:id])

  on_success = -> { "Successful response: #{response.data}" }
  on_error = -> { "Error: #{response.error.full_message}" }
  on_fail = -> { "Request failed" }

  ResponseHandler.handle(response, success: on_success, error: on_error, fail: on_fail)
end
