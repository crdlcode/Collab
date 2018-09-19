class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @owner = User.find(@project.members.where(owner: true)[0].user_id)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
    @member = Member.new
    @member.user_id = current_user.id
    @member.approved = true
    @member.owner = true
    @member.project_id = @project.id


    if @project.save
      @member = Member.new
      @member.user_id = current_user.id
      @member.approved = true
      @member.owner = true
      @member.project_id = @project.id
      @member.save
      redirect_to projects_url
    else
      flash[:notice] = "Invalid project information"
      render :new
    end
   end

end
