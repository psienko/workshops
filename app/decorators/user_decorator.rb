class UserDecorator < Draper::Decorator
  delegate_all

  def role
    "lol"
  end
end
