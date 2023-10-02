module ApplicationHelper
  def should_underline_link?(project)
    current_id = request.original_url.split('/').last.to_i
    if current_id == project.id
      true
    elsif request.path == root_path &&  project.id == Project.first.id
      true
    else 
      false
    end
  end
end
