require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can create a new contact for a company" do
    company = Company.create(name: "ESPN", city: "NYC")

    visit company_path(company)


    fill_in "contact[full_name]", with: "Taylor Swift"
    fill_in "contact[email]", with: "taylor@email.com"
    fill_in "contact[position]", with: "Sales"

    click_button "Submit"

    expect(page).to have_content("You created a contact")
    expect(Contact.count).to eq(1)
    expect(current_path).to eq("/companies/#{company.id}/jobs")
  end
end
