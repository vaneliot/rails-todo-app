require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
    # # called before every single test
    setup :initialize_task
 
    # called after every single test
    def teardown
        @task = nil
    end
    
    private
    
    def initialize_category
        @task = categories(:one)
    end
end