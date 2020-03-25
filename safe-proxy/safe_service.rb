require 'delegate'
require './service'

class SafeService < DelegateClass(Service)
  def initialize(target, on_error: ->(*) {})
    super(target)

    @error_handler = on_error
  end

  def perform(*args)
    result = super

    rescue StandardError => error
      @error_handler.call(error, :perform, args)
      return []
  end
end
