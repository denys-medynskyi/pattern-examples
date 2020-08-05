# def show
#   response = make_request

#   return handle_error if response.status == 'error'
#   return handle_fail if response.status == 'fail'

#   if response.status == 'success'
#     "successful response"
#   end
# end

class ResponseHandler
  def self.handle(response, strategies)
    strategies[response.status.to_sym].call
  end
end

def show
  response = make_request

  on_success = -> { "Successful response: #{response.data}" }
  on_fail = -> { "Request Failed" }
  on_error = -> { "Error: #{response.error_message}" }

  ResponseHandler.handle(response, success: on_success, error: on_error, fail: on_fail)
end
