ActiveAdmin.register Keyword do
  actions :index

 # filter :name

  scope :all, :default => true

  index do
    column("Keyword", :id)
    column("Name", :name)
    column("Created", :created_at)
  end
end
