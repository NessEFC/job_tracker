require 'rails_helper'

# As a User
# Given that a job exists and is associated with a company in the database
# When I visit the job's show page
# And I click on "Delete"
# Then I should see a flash message asking me if I really wish to delete this job
# And when I click "Yes"
# Then I should be directed back to the company jobs index page
# And I should not see the job I just deleted

RSpec.feature "User deletes a job from a company" do
  scenario "and the job no longer appears on the company's list of jobs" do
    company = Company.create!(name: "Starbucks")
    category = Category.create!(title: "Agile")
    job = company.jobs.create!(title: "Developer", description: "Cool job.", level_of_interest: 50, city: "Indianapolis", category_id: category.id)

    visit job_path(job)
    click_on "Delete"

    expect(current_path).to eq(company_path(company))
    expect(page).to_not have_content("Developer")
  end
end
