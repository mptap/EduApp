require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:profil).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

 #404 page will be returned when a profile is not found
  test "should render a 404 on profile not found" do
    get :show, id: "does'nt exist"
  	assert_response :not_found
  end

  test "Variables are assigned correctly" do
  	get :show, id: users(:profil).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end


  test "only shows the correct user's statuses" do
    get :show, id: users(:charu).profile_name
  	assigns(:statuses).each do |status|
  	    assert_equal users(:charu), status.user
  	end
  end


end

