require 'rails_helper'

describe "User visits the dashboard page" do
  scenario "a user can see correct info on the dashboard page" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = Job.create(title: "Developer", description: "New job description", level_of_interest: 70, company_id: company.id)
    job2 = Job.create(title: "Software", description: "Another job description", level_of_interest: 75, company_id: company.id)

    visit dashboard_index_path

    expect(page).to have_content("Level of interest: 75; Count: 1 ")
    expect(page).to have_content("ESPN; Interest Level = 72.5")
    expect(page).to have_content("NYC; 2")
  end
end
