ActiveAdmin::Dashboards.build do

  section "Recent Problems" do
    table_for Problem.where(:status => 'open').order('created_at asc') do
      column(:project_id)
      column("Reported") {|problem| problem.name}
      column("detail")
      column("contact")
      column("created_at")
    end
  end

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
    table_for Transaction.order('id desc').limit(5).each do |payment|
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
end
