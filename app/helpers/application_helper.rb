module ApplicationHelper
  def link_to_resume
    if current_user.resume.blank? || current_user.resume.new_record?
      link_to 'Create Resume', new_resume_path
    else
      link_to current_user.resume.title, edit_resume_path
    end
  end

  def message_icon_for(message)
    case message
    when "posted"
      image_tag('icon_big_accept.png', :style => 'border: none;')
    when "waiting_for_bids"
      image_tag('icon_big_clock.png', :style => 'border: none;')
    when "assigned"
      image_tag('icon_big_pay.png', :style => 'border: none;')
    when "work_in_progress"
      image_tag('icon_big_gear.png', :style => 'border: none;')
    when "work_completed"
      image_tag('icon_big_star.png', :style => 'border: none;')
    end
  end
end
