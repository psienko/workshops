class UserDecorator < Draper::Decorator
  delegate_all

  def role
    return 'admin' if h.current_user.admin?
    'standard user'
  end
end
