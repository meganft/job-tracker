class JobsController < ApplicationController
  before_action :set_company
  before_action :set_job, only: [:update, :edit, :destroy]

  def index
    @jobs = @company.jobs
    @contact = Contact.new
    if params[:sort]
      render :jobs_interest
    else
      render :index
    end
  end

  def new
    @job = Job.new()
    @categories = Category.all
    @comment = Comment.new
    @contact = Contact.new
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      flash[:error] = "Please fill in all fields."
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job = @job
  end

  def edit
  end

  def update
    @categories = Category.all
    if @job.update(job_params)
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :category_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = @company.jobs.find(params[:id])
  end
end
