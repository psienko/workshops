class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    "#{object.user.firstname} #{object.user.lastname}"
  end

  def date
    object.created_at.strftime("%d-%m-%y")
  end
end
