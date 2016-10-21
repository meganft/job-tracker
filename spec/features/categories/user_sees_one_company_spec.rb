require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create(title: "First Category")
    category2 = Category.create(title: "Second Category")
    job = Job.create(title: "Developer", description: "New job description", level_of_interest: 70, category_id: category.id)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("First Category")
    expect(page).to have_content("Developer")
  end
end
