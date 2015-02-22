class CategoryDecorator < Draper::Decorator
  delegate_all

  def new_category
    h.link_to 'New Category', h.new_category_path if can_call?
  end

  def edit_category
    h.link_to 'Edit', h.edit_category_path(object.id) if can_call?
  end

  private
  
  def can_call?
    h.current_user && h.current_user.admin?
  end
end
