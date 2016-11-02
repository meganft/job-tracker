require 'rails_helper'

describe "User deletes exisiting category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Puppies")

    visit categories_path
    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Puppies was successfully deleted!")
  end
end
