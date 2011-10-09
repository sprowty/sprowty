class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_presence_of :why
  validates_presence_of :offer_expires

  after_save :update_bids
  after_create :perform_project_actions

  private
  def update_bids
    self.project.bid_count = self.project.bid_count + 1
    self.project.save
  end

  def perform_project_actions
    ProjectAlert.create(:project_id => project.id, :message => why, :alert_type => 'bid', :occurred => DateTime.now)
  end
end
