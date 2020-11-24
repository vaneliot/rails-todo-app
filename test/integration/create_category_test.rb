require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
    test 'should go to new category form and create a category' do
        
        test_params = { name: 'new category name', description: 'new category description'};

        # get new_category
        # get new_categories_url
        # get new_categories_path
        # get categories_path
        get '/categories/new'
        assert_response :success

        # post create_category_path, params: { category: { name: 'new category name', description: 'new category description'} }
        post create_category_path, params: { category: test_params }
        # assert_response :redirect
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success
        

        
        category = Category.find_by(name: test_params[:name])
        assert_equal(category.name, test_params[:name])
        assert_equal(category.description, test_params[:description])
    end
end