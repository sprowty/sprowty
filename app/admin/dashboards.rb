ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

#  section "Recent Users" do
#    User.all.each do |user|
#      link_to user.username, user_path(user)
#    end
#  end

 section "Recent Works" do
   Work.all.each do |work|
     #link_to work.work, work_path(work)
   end
 end

  section "Recent Projects", :priority => 1 do
     table_for Project.order('id desc').each do |project|
       column(:title) {|project| link_to(project.title, admin_project_path(project)) }
       column(:price)
       column(:due_date)
       column(:sm_state) {|project|
         if project.sm_state == "pending_post"
           link_to("APPROVE", project_approve_path(project.id))
         else
           project.sm_state
         end
       }
     end
   end

  section "Recent Coin Purchases" do
     table_for Payment.order('id desc').limit(5).each do |payment|
       column(:id) {|payment| link_to(payment.id, admin_project_path(project)) }
       column(:amount)
       column(:sm_state)
     end
  end

  section "Recent Keywords", :priority => 3 do
    table_for Keyword.order('id desc').limit(5).each do |keyword|
      column(:name)
    end
  end

  section "Recent Users", :priority => 1 do
    table_for User.order('id desc').limit(5).each do |user|
      column(:email) {|user| link_to(user.email, admin_user_path(user)) }
      column(:username)
      column(:last_sign_in_at)
      column(:created_at)
      column("# Works") {|user| link_to(user.works.length, admin_user_path(user))}
    end
  end


  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end

  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end

  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
