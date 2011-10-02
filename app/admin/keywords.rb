ActiveAdmin.register Keyword do
  actions :index

  index do
    column("Keyword", :id)
    column("Name", :name)
    column("Created", :created_at)
  end
end
