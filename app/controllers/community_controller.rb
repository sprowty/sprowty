class CommunityController < ApplicationController
  respond_to :json, :js, :html

  def index
    @projects = Project.all
  end

end
