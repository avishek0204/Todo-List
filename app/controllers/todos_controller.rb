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
        Rails.logger.info "TodosController:new"
        @todo = Todo.new
    end

    def create_todo
        Rails.logger.info "TodosController::create_todo"
        @new_todo = Todo.new(title: params[:todo][:title], description: params[:todo][:description])
        Rails.logger.info "New todo: #{@new_todo.inspect}"

        if @new_todo.save
            flash[:notice] = "Todo created succesfully"
            redirect_to "/todos/#{@new_todo.id}"
        else 
            flash[:alert] = "Something went wrong"
            render "new"
        end

    end

    def edit_todo
        Rails.logger.info "TodosController::edit_todo"
        @existing_todo = Todo.find(params[:id])
        Rails.logger.info "#{@existing_todo.inspect}"
    end

    def update_todo
        Rails.logger.info "TodosController::update_todo"
    end

    def destroy
        Rails.logger.info "TodosController::destroy"
        @todo = Todo.find(params[:id]) 
        @todo.destroy
        redirect_to "/"
    end

end