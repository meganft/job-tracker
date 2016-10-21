require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment on a job" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = Job.create(title: "Developer", description: "New job description", level_of_interest: 70, company_id: company.id)

    visit company_job_path(job.company, job)

    fill_in "comment[content]", with: "New Commment!"

    click_button "Submit"

    expect(page).to have_content("You created a comment")
    expect(Comment.count).to eq(1)
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
  end

end
