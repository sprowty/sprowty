ActiveAdmin.register Project do
  filter :title
  filter :price
  filter :due_date

  index do
    id_column
    column :title
    column :price
    column :created_at
    default_actions
  end

  show :title => "Project" do
    panel "Project Bids" do
      table_for(project.bids) do
        column(:user_id)
        column("Price")
        column(:sm_state)
      end
    end
  end
end
