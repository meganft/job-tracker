require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", description: "New job description", level_of_interest: 70)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Sales"
    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("Sales")
    expect(page).to_not have_content("Developer")
  end
end
