module ApplicationHelper
  def is_admin(email)
    Member.where(admin: true, email: email).find_each do |member|
      return true
    end

    return false
  end

  def get_app_version()
    # change the return value of this function as app is updated through time to differentiate release versions
    
    return "v1.0"
  end
end