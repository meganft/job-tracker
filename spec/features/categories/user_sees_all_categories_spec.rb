require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create(title: "First Category")
    category2 = Category.create(title: "Second Category")

    visit categories_path

    expect(page).to have_content("First Category")
    expect(page).to have_content("Second Category")
  end

end
