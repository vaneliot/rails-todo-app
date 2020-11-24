require 'test_helper'

class UpdateCategoryTest < ActionDispatch::IntegrationTest

    test 'should go to update category form and update a category' do
        
        category = categories(:one)

        # get edit_category_path
        get '/categories/' + category.id.to_s + '/edit'
        # get categories_path
        assert_response :success

        # put update_category_path, params: { category: { name: 'Personal', description: 'buy milk 1L'} }
        put update_category_path, params: { category: { id: 1 , name: 'new name', description: 'new description'} }
        # put update_category_path, params: { category: category }
        # assert_response :redirect
        assert_redirected_to categories_path

        follow_redirect!
        assert_response :success

        category_updated = Category.find(category.id)

        assert_equal( category_updated.name, 'new name')
        assert_equal( category_updated.description, 'new description')
        
    end
end