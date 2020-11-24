require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
    test 'should go to new category form and create a category' do
        
        # get new_category
        # get new_categories_url
        # get new_categories_path
        # get categories_path
        get '/categories/new'
        assert_response :success

        post create_category_path, params: { category: { name: 'new category name', description: 'new category description'} }
        # assert_response :redirect
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success
        

        
        category = Category.find_by(name: 'new category name')
        assert_equal(category.name, 'new category name')
        assert_equal(category.description, 'new category description')
    end
end