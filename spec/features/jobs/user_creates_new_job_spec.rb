require 'rails_helper'

describe "User creates a new job" do
  before :each do
    @company = Company.create(name: "ESPN", city: "NYC")
    visit new_company_job_path(@company)
  end

  context "valid params" do
    scenario "a user can create a new job" do

      fill_in "job[title]", with: "Developer"
      fill_in "job[description]", with: "So fun!"
      fill_in "job[level_of_interest]", with: 80

      click_button "Create"

      expect(current_path).to eq("/companies/#{@company.id}/jobs/#{Job.last.id}")
      expect(page).to have_content("#{@company.name}")
      expect(page).to have_content("Developer")
      expect(page).to have_content("80")
    end
  end

  context "invalid params" do
    scenario "a user cannot create a new job with invalid params" do

      fill_in "job[title]", with: "Developer"
      fill_in "job[description]", with: "So fun!"

      click_button "Create"

      expect(current_path).to eq("/companies/#{@company.id}/jobs")
      expect(page).to have_content("Please fill in all fields.")
      expect(page).to_not have_content("So fun!")
      expect(Job.count).to eq(0)
    end
  end
end
