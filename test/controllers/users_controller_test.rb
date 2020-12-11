require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    
    include Devise::Test::IntegrationHelpers
    # include Devise::Test::ControllerHelpers

    # # called before every single test
    setup :initialize_user
 
    test "must be signed in to access tasks" do
        get '/tasks'
        assert_response :redirect

        sign_in @user
        get '/tasks'
        assert_response :success
    end
    
    private
    
    def initialize_user
        @user = users(:one)
    end

end

