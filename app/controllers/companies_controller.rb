class CompaniesController < ApplicationController

  def index
    @companies = Company.all
    if params[:location]
      @city = params[:location]
      @companies_by_location = Company.where(city: @city)
      render :one_location
    elsif params[:sort] == "location"
      render :location_companies
    else params[:sort].nil?
      render :index
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    company = Company.find(params[:id])
    redirect_to company_jobs_path(company)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.delete
    flash[:success] = "#{company.name} was successfully deleted!"
    redirect_to companies_path
  end

private

  def city_params
    return :city if params[:sort] == "location"
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end

end
