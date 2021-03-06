require 'test_helper'

class FranchisesControllerTest < ActionController::TestCase
  setup do
    @franchise = franchises(:nyy)
		@update = {
			abbr: 'IND',
			city: 'Independent',
			name: 'Franchise'
		}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:franchises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create franchise" do
    assert_difference('Franchise.count') do
      post :create, franchise: @update
    end

    assert_redirected_to franchise_path(assigns(:franchise))
  end

  test "should show franchise" do
    get :show, id: @franchise
    assert_response :success
  end
	
	test "should find logo in assets" do
		assert_not_nil Org::Application.assets.find_asset(@franchise.logo)
	end
	
	test "should find wordmark in assets" do
		assert_not_nil Org::Application.assets.find_asset(@franchise.wordmark)
	end

  test "should get edit" do
    get :edit, id: @franchise
    assert_response :success
  end

  test "should update franchise" do
    patch :update, id: @franchise, franchise: @update
    assert_redirected_to franchise_path(assigns(:franchise))
  end

  test "should destroy franchise" do
    assert_difference('Franchise.count', -1) do
      delete :destroy, id: @franchise
    end

    assert_redirected_to franchises_path
  end
end
