require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers

    # # called before every single test
    setup :initialize_login
    setup :initialize_category
 
    # called after every single test
    def teardown
        # as we are re-initializing @category before every test
        # setting it to nil here is not essential but I hope
        # you understand how you can use the teardown method
        @category = nil
    end

    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should get show" do
        category = categories(:one)
        get categories_path(category)
        assert_response :success
    end

    test "should get new" do
        # get new_category
        get '/categories/new'
        assert_response :success
    end

    test "should get edit" do

        category = categories(:one)
        get '/categories/' + category.id.to_s + '/edit'
        # get categories_path
        assert_response :success

    end

    test "should put update" do
        category = categories(:one)

        put '/categories/' + category.id.to_s, params: { category: { name: 'updated name', description: 'updated description'} }
        assert_redirected_to categories_path
        category.reload # reload to apply changes

        assert_equal(category.name, 'updated name')
        assert_equal(category.description, 'updated description')
    end

    test "should destroy category" do
        category = categories(:one)
        
        assert_difference('Category.count', -1) do
            delete category_path(category)
        end
        
        assert_redirected_to categories_path
    end

    test 'should get all tasks page' do
        get '/tasks'
        assert_response :success
    end

    test 'should get home page' do
        get '/'
        assert_response :success

        get '/home'
        assert_response :success

        get '/today'
        assert_response :success
    end

    private
    
    def initialize_category
        @category = categories(:one)
    end

    def initialize_login
        get '/users/sign_in'
        sign_in users(:one)
        post user_session_url

        # follow_redirect!
        # assert_response :success
    end

end