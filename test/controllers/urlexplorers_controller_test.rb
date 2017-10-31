require 'test_helper'

class UrlexplorersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urlexplorer = urlexplorers(:one)
  end

  test "should get index" do
    get urlexplorers_url
    assert_response :success
  end

  test "should get new" do
    get new_urlexplorer_url
    assert_response :success
  end

  test "should create urlexplorer" do
    assert_difference('Urlexplorer.count') do
      post urlexplorers_url, params: { urlexplorer: { content: @urlexplorer.content, is_parsing_done: @urlexplorer.is_parsing_done, parsed_headers: @urlexplorer.parsed_headers, url: @urlexplorer.url } }
    end

    assert_redirected_to urlexplorer_url(Urlexplorer.last)
  end

  test "should show urlexplorer" do
    get urlexplorer_url(@urlexplorer)
    assert_response :success
  end

  test "should get edit" do
    get edit_urlexplorer_url(@urlexplorer)
    assert_response :success
  end

  test "should update urlexplorer" do
    patch urlexplorer_url(@urlexplorer), params: { urlexplorer: { content: @urlexplorer.content, is_parsing_done: @urlexplorer.is_parsing_done, parsed_headers: @urlexplorer.parsed_headers, url: @urlexplorer.url } }
    assert_redirected_to urlexplorer_url(@urlexplorer)
  end

  test "should destroy urlexplorer" do
    assert_difference('Urlexplorer.count', -1) do
      delete urlexplorer_url(@urlexplorer)
    end

    assert_redirected_to urlexplorers_url
  end
end
