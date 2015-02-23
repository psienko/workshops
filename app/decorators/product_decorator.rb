class ProductDecorator < Draper::Decorator
  delegate_all

  def edit_product
    if h.current_user.nil? || object.user_id == h.current_user.id
      h.link_to 'Edit', h.edit_category_product_path(object.category, object),  class: 'btn btn-sm btn-secondary'
    end
  end
end
