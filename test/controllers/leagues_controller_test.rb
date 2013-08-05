require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase
  setup do
    @league = leagues(:american)
		@update = {
			abbr: 'NL',
			name: 'National League',
			level: 'MLB'
		}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leagues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create league" do
    assert_difference('League.count') do
      post :create, league: @update
    end

    assert_redirected_to league_path(assigns(:league))
  end

  test "should show league" do
    get :show, id: @league
    assert_response :success
  end
	
	test "should find logo in assets" do
		assert_not_nil Org::Application.assets.find_asset(@league.logo)
	end

  test "should get edit" do
    get :edit, id: @league
    assert_response :success
  end

  test "should update league" do
    patch :update, id: @league, league: @update
    assert_redirected_to league_path(assigns(:league))
  end

  test "should destroy league" do
    assert_difference('League.count', -1) do
      delete :destroy, id: @league
    end

    assert_redirected_to leagues_path
  end
end
