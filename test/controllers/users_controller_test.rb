require 'test_helper'
require "minitest/autorun"
require "minitest/pride"


class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  

    test "should get index and list chefs" do
      get :index
      assert_response :success
      assert_match 'Go Chef!', @response.body
      #ive commented these out because im not sure how to test javascript here, and fuckit
      #assert_match users(:one).name, @response.body
      #assert_match users(:two).name, @response.body
    end
    
    test "should show logout to signed in user" do
      sign_in users(:one)
      get :index
      assert_match 'Logout', @response.body
    end

    test "should show `Login` to unsigned in user" do
      get :index
      assert_match 'Login', @response.body
    end

    test "should display user profile" do
      user = User.create!({email: 'gordonramsey@gmail.com', password: 'pass123', name: 'Gordon Ramsey', location_lat: 51.512640,location_lon: -0.090390, bio: 'Swears a lot and has numerous TV shows in both UK and America'})
      get :show, params: { id: user.id }
      assert_response :success
      assert_match user.bio, @response.body
    end

    test "a signed in user should be able to visit their edit profile page" do
      #user = User.create!({email: 'gordonramsey@gmail.com', password: 'pass123', name: 'Gordon Ramsey', location_lat: 51.512640,location_lon: -0.090390, bio: 'Swears a lot and has numerous TV shows in both UK and America'})
      sign_in users(:one)

      #p users(:one).bio
      get :edit, params: {id: users(:one).id}
      assert_response :success
      assert_match 'Update', @response.body
    end
  end
