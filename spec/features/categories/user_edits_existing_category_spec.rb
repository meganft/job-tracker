require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create(title: "First Category")

    visit edit_category_path(category)

    fill_in "category[title]", with: "New Category"
    click_button "Update Category"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("First Category updated!")
    expect(page).to_not have_content("New Category")
  end
end
