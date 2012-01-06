module HomeHelper
  def share_link
    link_to 'Share', '#', :id => 'stay-target-12', :class => 'stay-tooltip-target.tooltip-target tiptip', :title => "#{image_tag('icon_facebook.png')} #{image_tag('icon_twitter.png')} #{image_tag('icon_mail.png')}"
  end
end
