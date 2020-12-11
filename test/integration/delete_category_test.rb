require 'test_helper'

class DeleteCategoryTest < ActionDispatch::IntegrationTest
    
    include Devise::Test::IntegrationHelpers

    setup :initialize_login

    test 'should delete a category' do
        
        category = categories(:one)
        
        assert_difference('Category.count', -1) do
            delete category_path(category)
        end

        assert_redirected_to categories_path
        
    end

    private
    
    def initialize_login
        get '/users/sign_in'
        sign_in users(:one)
        post user_session_url

        # follow_redirect!
        # assert_response :success
    end
    
end
