module HomeHelper
  def display_sharing_tooltip
    link_to 'Share', '#',
      :id => 'stay-target-12',
      :class => 'stay-tooltip-target.tooltip-target tiptip',
      :title => "<ul class='share_icons'>" +
                "<li>#{link_to(image_tag('icon_facebook.png'),'#')}</li>" +
                "<li>#{link_to(image_tag('icon_twitter.png'), '#')}</li>" +
                "<li>#{link_to(image_tag('icon_mail.png'), '#')}</li>" +
                "</ul>"
  end

  def display_poster_tooltip(project)
    link_to project.user.username, project.user.profile,
      :id => 'poster_tip',
      :class => 'stay-tooltip-target.tooltip-target tiptip',
      :title => "<ul class='poster_tip'>" +
                "<li class='username'>#{link_to project.user.username}</li>" +
                "<li class='location'>City, State</li>" +
                "<ul class='ratings'>" +
                "<li class='positive'>0</li>" +
                "<li class='negative'>0</li>" +
                "</ul></ul>"
  end

end
