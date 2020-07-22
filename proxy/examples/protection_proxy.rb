# Protects access to the object
class Folder
  def self.create(name)
  end
end

class FolderProxy
  def initialize(user)
    @user = user
  end

  def create(folder_name)
    raise 'Only Admin can create it' unless user.is_admin?

    Folder.create(folder_name)
  end
end

