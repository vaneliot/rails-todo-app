class CategoriesController < ApplicationController
    
    # before_action :authenticate_user!

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new  
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            # redirect_to @category
            redirect_to categories_path
        else
            render :edit
        end
    end

    def today
        @categories = Category.all
    end

    def all_tasks
        @categories = Category.all
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path
    end

    private
    def category_params
        params.require(:category).permit(:name, :description)
    end
    
end