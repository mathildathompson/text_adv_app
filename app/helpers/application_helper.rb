module ApplicationHelper

  def active link_name
    #html code to return on success
    active = ' class="active"'

    #conditions to determine if active
    html_class = case link_name
    when 'adventures'
      active if ((controller_name == 'adventures') && (['new','my_creations'].exclude? action_name)) || controller_name == 'scenes'
    when 'my_creations'
      active if (controller_name == 'adventures') && (action_name == 'my_creations')
    when 'new_adventure'
      active if (controller_name == 'adventures') && (action_name == 'new')
    when 'guide'
      active if (controller_name == 'home') && (action_name == 'guide')
    else
      ""
    end

    #if nothing matches
    html_class ||= ''
    #set as safe html
    html_class.html_safe
  end

end
