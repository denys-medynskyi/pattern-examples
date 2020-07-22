# Remote proxy provides an object replacement.
class UserProxy
  def find(id)
    server.find(id)
  end

  private

  def server
    @server ||= XMLRPC::Client.new2("http://myproject/api/user")
  end
end
