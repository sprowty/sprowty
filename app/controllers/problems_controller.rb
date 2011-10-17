class ProblemsController < InheritedResources::Base
  def index
  end

  def new
    @problem = Project.find(params[:project_id]).problems.build
  end

  def create
    if Problem.create(params[:problem])
      flash[:notice] = "Thank you. We will review and respond within 24 hours."
      redirect_to :back
    else
      flash[:error] = "There was a problem processing your request."
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def show
  end
end
