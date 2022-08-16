class TodosController < ApplicationController
    def index
        Rails.logger.info "TodosController::index"
        # @todos = Todo.all
        @todos_completed = Todo.where(completed: true)
        @todos_pending = Todo.where(completed: false)
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
            flash[:notice] = "Todo created succesfully!!"
            redirect_to "/todos/#{@new_todo.id}"
        else 
            flash[:alert] = "Something went wrong!!"
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
        Rails.logger.info "Parameters:: #{params}"
        @existing_todo = Todo.find(params[:id])
        if @existing_todo.update(title: params[:todo][:title], description: params[:todo][:description])
            flash[:notice] = "Todo updated sucessfully!!"
            redirect_to "/todos/#{params[:id]}"
        else  
            flash[:alert] = "Something went wrong!!"
            redirect_to "/todos/#{params[:id]}/edit"
        end
    end

    def destroy
        Rails.logger.info "TodosController::destroy"
        @todo = Todo.find(params[:id]) 
        @todo.destroy
        flash[:deleted] = "Todo deleted sucessfully!!" 
        redirect_to "/"
    end

    def mark_completed
        Rails.logger.info "TodosController::mark_completed"
        @todo = Todo.find(params[:id])
        Rails.logger.info "Todo:: #{@todo.inspect}"
        is_completed = @todo.completed
        @todo.update(completed: !is_completed)
        redirect_to "/"
    end

end