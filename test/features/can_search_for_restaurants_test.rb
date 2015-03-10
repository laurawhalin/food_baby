require "test_helper"

class CanSearchForRestaurantsTest < Capybara::Rails::TestCase

  before {
    Restaurant.create([{
      name: "Wine Bar",
      latitude: 39.743376,
      longitude: -104.980397,
      kid_friendly: false,
      kids_menu: false,
      address: "523 E 17th Ave",
      locality: "Denver",
      region: "CO",
      postcode: "80203",
      phone_number: "(303) 830-1001",
      website: "http://www.steubens.com/",
      # cuisine: ["American","Traditional","Burgers","Sandwiches","Pub Food"]
    },
    {
      name: "Kiddie Korner",
      latitude: 39.719513,
      longitude: -104.956276,
      kid_friendly: true,
      kids_menu: true,
      address: "2641 E 2nd Ave",
      locality: "Denver",
      region: "CO",
      postcode: "80206",
      phone_number: "(303) 322-7666",
      website: "http://www.cherrycricket.com",
      # cuisine: ["Burgers","American","Pub Food","Mexican","Traditional"]
    }])
  }

  feature "User can search for restaurants" do
    scenario "with kids" do
      visit root_path
      click_link_or_button "Eat with Kids"
      page.must_have_content("Kiddie Korner")
      page.must_have_content("1 Kid-friendly restaurant")
      page.wont_have_content("Wine Bar")
    end

    scenario "without kids" do
      visit root_path
      click_link_or_button "Eat without Kids"
      page.must_have_content("Wine Bar")
      page.must_have_content("1 Non-kid restaurant")
      page.wont_have_content("Kiddie Korner")
    end

    scenario "and view the details of a selected restaurant" do
      visit root_path
      click_link_or_button "Eat with Kids"
      click_link_or_button "Kiddie Korner"
      page.must_have_content("Kiddie Korner")
      page.must_have_content("Website")
    end
  end
end
