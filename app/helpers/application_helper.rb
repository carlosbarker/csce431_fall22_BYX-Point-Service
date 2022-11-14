module ApplicationHelper
  def is_admin(email)
    Member.where(admin: true, email: email).find_each do |member|
      return true
    end

    return false
  end
end