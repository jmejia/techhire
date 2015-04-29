class Admin::CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def destroy
    Company.find(params[:id]).destroy
    redirect_to admin_companies_path
  end

  def update
    company = Company.find(params[:id])
    company.update(update_params)
    company.update(status: params[:company][:status])
    company.save
    redirect_to admin_company_path(company.id)
  end

  def edit
    @company = Company.find(params[:id])
  end

  private

  def update_params
    params.require(:company).permit(:name, :organization, :title,
                                 :email, :state, :city, :status)
  end
end
