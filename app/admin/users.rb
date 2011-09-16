ActiveAdmin.register User do
  filter :username
  filter :email
  filter :created_at

  index do
    id_column
    column :username
    column :email
    column :created_at
    default_actions
  end

  show :title => :username do
    panel "Recent Activity" do
      table_for(user.bids) do
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
