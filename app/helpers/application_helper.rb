module ApplicationHelper
  def link_to_resume
    if current_user.resume.blank? || current_user.resume.new_record?
      link_to 'Create Resume', new_resume_path
    else
      link_to current_user.resume.title, edit_resume_path
    end
  end
end
