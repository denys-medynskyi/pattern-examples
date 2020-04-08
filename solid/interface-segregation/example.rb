# before
class User
  def notify_admin_new_user_registered
    "New #{full_name} was added. Check details here - #{profile_url}"
  end

  def full_name
  end

  def profile_url
  end
end

# after

class NotifyAdminAboutNewRecord
  def notify(record)
    "New #{record.name} was added. Check details here - #{record.link}"
  end
end

class UserNewRecord
  def initialize(user)
  end


  def record_name
  end

  def record_link
  end
end

user = User.create
new_record = UserNewRecord.new(user)

NotifyAdminAboutNewRecord.new(new_record)

# #### #####
module NewRecord
  def record_name
    fail 'Not Implemented'
  end

  def record_link
    fail 'Not Implemented'
  end
end

class EventNewRecord
  include NewRecord

  def record
  end

  def link
  end
end
