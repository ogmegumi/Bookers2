require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get books_users_url
    assert_response :success
  end

end
