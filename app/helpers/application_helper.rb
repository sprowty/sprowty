module ApplicationHelper
  def link_to_resume
    if current_user.resume.blank? || current_user.resume.new_record?
      link_to 'Create Resume', new_user_resume_path(current_user.id)
    else
      link_to 'My Resume', user_resume_path(current_user.id, current_user.resume.id)
    end
  end
end
