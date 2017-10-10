require 'test_helper'

class QuizResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_result = quiz_results(:one)
  end

  test "should get index" do
    get quiz_results_url
    assert_response :success
  end

  test "should get new" do
    get new_quiz_result_url
    assert_response :success
  end

  test "should create quiz_result" do
    assert_difference('QuizResult.count') do
      post quiz_results_url, params: { quiz_result: {  } }
    end

    assert_redirected_to quiz_result_url(QuizResult.last)
  end

  test "should show quiz_result" do
    get quiz_result_url(@quiz_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_result_url(@quiz_result)
    assert_response :success
  end

  test "should update quiz_result" do
    patch quiz_result_url(@quiz_result), params: { quiz_result: {  } }
    assert_redirected_to quiz_result_url(@quiz_result)
  end

  test "should destroy quiz_result" do
    assert_difference('QuizResult.count', -1) do
      delete quiz_result_url(@quiz_result)
    end

    assert_redirected_to quiz_results_url
  end
end
