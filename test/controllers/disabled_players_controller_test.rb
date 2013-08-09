require 'test_helper'

class DisabledPlayersControllerTest < ActionController::TestCase
  setup do
    @disabled_player = disabled_players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disabled_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disabled_player" do
    assert_difference('DisabledPlayer.count') do
      post :create, disabled_player: { end_date: @disabled_player.end_date, franchise_id: @disabled_player.franchise_id, length: @disabled_player.length, player_id: @disabled_player.player_id, reason: @disabled_player.reason, rehab: @disabled_player.rehab, start_date: @disabled_player.start_date, year: @disabled_player.year }
    end

    assert_redirected_to disabled_player_path(assigns(:disabled_player))
  end

  test "should show disabled_player" do
    get :show, id: @disabled_player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disabled_player
    assert_response :success
  end

  test "should update disabled_player" do
    patch :update, id: @disabled_player, disabled_player: { end_date: @disabled_player.end_date, franchise_id: @disabled_player.franchise_id, length: @disabled_player.length, player_id: @disabled_player.player_id, reason: @disabled_player.reason, rehab: @disabled_player.rehab, start_date: @disabled_player.start_date, year: @disabled_player.year }
    assert_redirected_to disabled_player_path(assigns(:disabled_player))
  end

  test "should destroy disabled_player" do
    assert_difference('DisabledPlayer.count', -1) do
      delete :destroy, id: @disabled_player
    end

    assert_redirected_to disabled_players_path
  end
end
