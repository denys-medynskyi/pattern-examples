# Protects access to the object
class FolderFactory
  def create(folder_name)
  end
end

class FolderFactoryProxy
  def initialize(user, folder_factory)
    @user = user
    @folder_factory = folder_factory
  end

  def create(folder_name)
    raise 'Only Admin can create it' unless @user.is_admin?

    @folder_factory.create(folder_name)
  end
end

