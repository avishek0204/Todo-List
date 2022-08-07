class TodosController < ApplicationController
    def index
        Rails.logger.info "TodosController::index"
        @todos = Todo.all
    end

    def show
        Rails.logger.info "TodosController::show"
        @todo = Todo.find(params[:id])
    end

    def new
        Rails.logger.info "TodosController::new"
    end

    def create
        Rails.logger.info "TodosController::create"
        title = params[:title]
        description = params[:description]
        @todo = Todo.new(title: title, description: description)
        if @todo.save
            flash[:notice] = "Todo created succesfully"
            redirect_to "/todos/#{@todo.id}"
        else 
            flash[:alert] = "Something went wrong"
            render "todos/new"
        end
        
    end
end