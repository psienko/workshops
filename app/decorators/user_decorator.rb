class UserDecorator < Draper::Decorator
  delegate_all

  def role
    return 'admin' if h.current_user.admin?
    'standard user'
  end

  def display_edit_button_in_panel_footer
    return nil if h.current_user != object
    h.content_tag :div, class: 'panel-footer row' do
      h.content_tag :div, class: 'pull-right' do
        edit
      end
    end
  end

  def edit
    h.link_to 'Edit My Profile', h.edit_user_registration_path, class: 'btn btn-lg btn-success'
  end
end
