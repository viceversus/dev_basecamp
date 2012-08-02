module UsersHelper
  def private_or_public(project)
    project.private ? "Private" : "Public"
  end
end
