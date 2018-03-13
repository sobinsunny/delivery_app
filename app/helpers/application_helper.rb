module ApplicationHelper
  def signd_in?
    current_user.present?
  end
end
