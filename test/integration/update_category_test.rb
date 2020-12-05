require 'test_helper'

class UpdateCategoryTest < ActionDispatch::IntegrationTest

    test 'should go to update category form and update a category' do
        
        test_params = { id: 1 , name: 'new name', description: 'new description'} 

        category = categories(:one)
        get '/categories/' + category.id.to_s + '/edit'
        assert_response :success

        put category_path, params: { category: test_params }

        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success

        category_updated = Category.find(category.id)

        assert_equal( category_updated.name, test_params[:name])
        assert_equal( category_updated.description, test_params[:description])
        
    end
end