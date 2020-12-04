class TasksController < ApplicationController
    
    before_action :get_category

    def index
        # @tasks = Task.all
        @tasks = @category.tasks
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        # @task = Task.new
        @task = @category.tasks.build
    end

    def create
        # @task = Task.new
        @task = @category.tasks.build(task_params)
        if @task.save
            # redirect_to tasks_path
            redirect_to category_tasks_path
        else
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            # redirect_to @task
            # redirect_to tasks_path
            redirect_to category_tasks_path
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        # redirect_to category_task_path
        redirect_to @category
        # NOTE: must be redirected to category
    end

    def get_category
        @category = Category.find(params[:category_id])
    end

    private
    def task_params
        params.require(:task).permit(:name, :description, :deadline, :completed, :started, :category_id)
    end
    
end