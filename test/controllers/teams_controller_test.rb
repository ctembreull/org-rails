require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = teams(:nyy)
		@update = {
			franchise_id: 2,
			league_id: 2,
			abbr: 'ANO',
			city: 'Anonymous',
			name: 'Team'
		}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.count') do
      post :create, team: @update
    end

    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end
	
	test "should find logo in assets" do
		assert_not_nil Org::Application.assets.find_asset(@team.logo)
	end

  test "should get edit" do
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    patch :update, id: @team, team: @update
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to teams_path
  end
end
