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
    panel "Project Detail" do
      table_for(project) do
        #column("Order", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
        #column("State") {|order| status_tag(order.state) }
        #column("Date", :sortable => :checked_out_at){|order| pretty_format(order.checked_out_at) }
        #column("Total") {|order| number_to_currency order.total_price }
      end
    end
    active_admin_comments
  end

  sidebar "User Details", :only => :show do
    attributes_table_for user, :username, :email, :created_at
  end
end
