require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create(name: "ESPN", city: "LA")
    job = company.jobs.create(title: "Developer", level_of_interest: 70)
    job2 = company.jobs.create(title: "Engineer", level_of_interest: 50)

    tag = job.tags.create(name: "interested")

    job2.tags << tag

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
    expect(page).to have_content(tag.name)
    expect(page).to have_content(2)
  end
end
