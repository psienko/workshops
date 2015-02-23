class CategoryDecorator < Draper::Decorator
  delegate_all

  def new_category
    h.link_to 'New Category', h.new_category_path, class: 'btn btn-lg btn-success' if can_call?
  end

  def edit_category
    h.link_to 'Edit', h.edit_category_path(object.id), class: 'btn btn-sm btn-secondary' if can_call?
  end

  private

  def can_call?
    h.current_user.nil? || h.current_user.admin?
  end
end
