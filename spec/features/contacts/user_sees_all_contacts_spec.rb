require 'rails_helper'

describe "User sees all contacts" do
  scenario "a user can see all contacts for a job" do
    company = Company.create(name: "ESPN", city: "NYC")
    contact = Contact.create(full_name: "Bugs Bunny", email:"bugs@email.com", position:"Sales", company_id: company.id)
    contact2 = Contact.create(full_name: "Walt Disney", email:"walt@email.com", position:"Executive", company_id: company.id)

    visit company_path(company)

    expect(Contact.count).to eq(2)
    expect(page).to have_content("Bugs Bunny")
    expect(page).to have_content("Walt Disney")
  end
end
