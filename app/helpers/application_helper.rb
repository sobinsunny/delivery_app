module ApplicationHelper
  # Helper to checkuser sign in
  def signd_in?
    current_user.present?
  end
end
