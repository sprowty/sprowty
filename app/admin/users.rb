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
    p do
      "Click on thumbnail to toggle approval status"
    end
    panel "Profile" do
      table do
        tr do
          th "Profile Image"
          th "Image"
        end
        tr do
          td link_to(image_tag(user.profile.picture.url, :size => '100x100'), approve_profile_path(user.profile))
          td link_to(user.profile.image_approved, approve_profile_path(user.profile))
        end
      end
    end

    panel "Works" do
      table_for(user.works) do
        column(:work) {|work| link_to(image_tag(work.work.url, :size => '100x100'), approve_work_path(work))}
        column(:image_approved) {|work| link_to(work.image_approved, approve_work_path(work))}
      end
    end
    active_admin_comments
  end

  sidebar "User Details", :only => :show do
    attributes_table_for user, :username, :email, :created_at
  end
end
