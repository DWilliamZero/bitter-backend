require 'test_helper'

class HatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hate = hates(:one)
  end

  test "should get index" do
    get hates_url, as: :json
    assert_response :success
  end

  test "should create hate" do
    assert_difference('Hate.count') do
      post hates_url, params: { hate: { hate: @hate.hate, post_id: @hate.post_id, user_id: @hate.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show hate" do
    get hate_url(@hate), as: :json
    assert_response :success
  end

  test "should update hate" do
    patch hate_url(@hate), params: { hate: { hate: @hate.hate, post_id: @hate.post_id, user_id: @hate.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy hate" do
    assert_difference('Hate.count', -1) do
      delete hate_url(@hate), as: :json
    end

    assert_response 204
  end
end
