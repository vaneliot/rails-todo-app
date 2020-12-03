class TasksController < ApplicationController
    
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        if (params[:category_id])
            puts 'creating Task from an existing Category'
            puts params[:category_id]
            @task = Task.new(category_id: params[:category_id])
        else
            puts 'creating a new Task'
            @task = Task.new 
        end
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to tasks_path
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
            redirect_to tasks_path
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    private
    def task_params
        params.require(:task).permit(:name, :description, :deadline, :completed, :started, :category_id)
    end
    
end