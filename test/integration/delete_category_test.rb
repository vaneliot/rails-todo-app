require 'test_helper'

class DeleteCategoryTest < ActionDispatch::IntegrationTest
    test 'should delete a category' do
        
        category = categories(:one)
        
        assert_difference('Category.count', -1) do
            delete category_path(category)
        end

        assert_redirected_to categories_path
        
    end
end
