require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success 
    assert_difference 'Category.count', 1 do 
      post categories_path, params: { category: { name: "Augemented Reality"}}
      assert_response :redirect
    end
    follow_redirect! #helper method
    assert_response :success 
    assert_match "Augemented Reality", response.body
  end
end
