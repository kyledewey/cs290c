require 'test_helper'

class CommunitiesControllerTest < ActionController::TestCase
  setup do
    @community = communities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:communities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community" do
    assert_difference('Community.count') do
      post :create, community: { name: 'Good' }
    end

    assert_redirected_to community_path(assigns(:community))
  end

  test "should show community" do
    get :show, id: @community
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community
    assert_response :success
  end

  test "should update community" do
    patch :update, id: @community, community: { name: 'Good' }
    assert_redirected_to community_path(assigns(:community))
  end

  test "should destroy community" do
    assert_difference('Community.count', -1) do
      delete :destroy, id: @community
    end

    assert_redirected_to communities_path
  end

  test 'fail when community name is too small' do
    c = Community.new name: 'bad'
    assert c.invalid?
  end

  test 'fail when community name is a duplicate' do
    c = Community.new name: @community.name
    assert c.invalid?
  end
end
