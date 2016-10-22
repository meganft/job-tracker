class ContactsController < ApplicationController

  def create
    company = Company.find(params[:contact][:company_id])
    @contact = Contact.create(contact_params)
    @contact.company_id = company.id
      flash[:success] = "You created a contact"
      redirect_to company_path(company)
  end

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end

end
