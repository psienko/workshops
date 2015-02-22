class CategoryDecorator < Draper::Decorator
  delegate_all

  def new_category
    if h.current_user && h.current_user.admin?
      h.link_to 'New Category', h.new_category_path
    end
  end
end
