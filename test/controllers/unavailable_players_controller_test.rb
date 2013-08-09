require 'test_helper'

class UnavailablePlayersControllerTest < ActionController::TestCase
  setup do
    @unavailable_player = unavailable_players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unavailable_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unavailable_player" do
    assert_difference('UnavailablePlayer.count') do
      post :create, unavailable_player: { end_date: @unavailable_player.end_date, franchise_id: @unavailable_player.franchise_id, length: @unavailable_player.length, player_id: @unavailable_player.player_id, reason: @unavailable_player.reason, start_date: @unavailable_player.start_date, year: @unavailable_player.year }
    end

    assert_redirected_to unavailable_player_path(assigns(:unavailable_player))
  end

  test "should show unavailable_player" do
    get :show, id: @unavailable_player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unavailable_player
    assert_response :success
  end

  test "should update unavailable_player" do
    patch :update, id: @unavailable_player, unavailable_player: { end_date: @unavailable_player.end_date, franchise_id: @unavailable_player.franchise_id, length: @unavailable_player.length, player_id: @unavailable_player.player_id, reason: @unavailable_player.reason, start_date: @unavailable_player.start_date, year: @unavailable_player.year }
    assert_redirected_to unavailable_player_path(assigns(:unavailable_player))
  end

  test "should destroy unavailable_player" do
    assert_difference('UnavailablePlayer.count', -1) do
      delete :destroy, id: @unavailable_player
    end

    assert_redirected_to unavailable_players_path
  end
end
