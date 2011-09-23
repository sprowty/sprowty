ActiveAdmin.register Work do
  actions :index

  filter :image_approved
  filter :work
  filter :user_id

  index do
    id_column
    column :user_id
    column :work
    column :created_at
    default_actions
  end

  show :title => 'boo' do
    h3 work.work_file_name
    div do
      work_file_name
    end
  end

  member_action :approve, :method => :put do
    work = Work.find(params[:id])
    work.image_approved=true
    work.save!
    redirect_to :action => :show, :notice => "Approved!"
  end
end

