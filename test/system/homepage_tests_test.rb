require "application_system_test_case"

class HomepageTestsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    assert_selector "h1", text: "Go Chef!"
    assert page.has_content? users(:one).name
    p @response.body
  end

  test "click the login" do
    visit root_url
    click_on "Login"
    fill_in "Email", with: users(:one).email
    click_on "Log in"
    #fill_in "Password", with: users(:one).email
    #assert_selector "h2", text: "Chef Login"
    assert page.has_content? "Invalid Email or password."
  end

end
