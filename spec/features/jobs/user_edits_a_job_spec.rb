require 'rails_helper'

# As a User
# Given that a job exists and belongs to a company in the database
# When I vist the job's show page
# And I click on "Edit Job"
# And I enter a new title
# And I enter a new level of interest
# And I click "Update Job"
# Then I should be redirected to the job's show page
# And I should see the company name
# And I should see the job's updated title
# And I should see the job's updated level of interest
# And I should see the same description and city



describe "User edits a job" do
  scenario "a user can edit a job's information" do
    company = Company.create!(name: "Starbucks")
    category = Category.create!(title: "Agile")
    job = company.jobs.create!(title: "Developer", description: "Cool job.", level_of_interest: 50, city: "Indianapolis", category_id: category.id)

    visit job_path(job)
    click_on "Edit Job"
    fill_in "job[title]", with: "Software Engineer"
    fill_in "job[level_of_interest]", with: 80
    click_on "Update Job"

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content("Starbucks")
    expect(page).to have_content("Software Engineer")
    expect(page).to have_content("Cool job.")
    expect(page).to have_content("80")
    expect(page).to have_content("Indianapolis")
  end
end
