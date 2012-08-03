module UsersHelper
  def private_or_public(project)
    project.restricted ? "Private" : "Public"
  end
end
