require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "CategoryNew"

    click_button "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("CategoryNew")
    expect(Category.count).to eq(1)
  end
  scenario "a user cannot create a category that already exists" do
    category = Category.create(title: "First Category")

    visit new_category_path
    fill_in "category[title]", with: "First Category"

    click_button "Create Category"

    expect(current_path).to eq("/categories")
    expect(page).to have_content("New Category")

  end
end

#add test for invlaid params or missing title?
