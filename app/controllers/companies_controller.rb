class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # POST /companies
  def create
    @company = Company.new(
      params.require(:company).permit(:name, :location))

    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

end
