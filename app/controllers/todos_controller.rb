class TodosController < ApplicationController
    def index
        Rails.logger.info "TodosController::index"
        @todos_completed = Todo.where(completed: true, is_deleted: false)
        @todos_pending = Todo.where(completed: false, is_deleted: false)
    end

    def show
        Rails.logger.info "TodosController::show"
        @todo = Todo.find_by(id: params[:id])
        Rails.logger.info "todo: #{@todo.inspect}"
        if @todo.nil? || @todo[:is_deleted]
            render '/404'
        end
    end

    def new
        Rails.logger.info "TodosController:new"
        @new_todo = Todo.new
    end

    def create_todo
        Rails.logger.info "TodosController::create_todo"
        @new_todo = Todo.new(title: params[:todo][:title], description: params[:todo][:description])
        @new_todo.user = User.first
        Rails.logger.info "New todo: #{@new_todo.inspect}"
        if @new_todo.save
            Rails.logger.info "New todo: if"
            flash[:notice] = "Todo created succesfully!!"
            redirect_to "/todos/#{@new_todo.id}"
        else 
            Rails.logger.info "New todo: else"
            Rails.logger.info "New todo: #{@new_todo.inspect}"
            render :new
        end

    end

    def edit_todo
        Rails.logger.info "TodosController::edit_todo"
        @existing_todo = Todo.find_by(id: params[:id])
        Rails.logger.info "Existing todo:: #{@existing_todo.inspect}"
        if @existing_todo.nil? || @existing_todo[:is_deleted]
            render '/404'
        end
        Rails.logger.info "#{@existing_todo.inspect}"
    end

    def update_todo
        Rails.logger.info "TodosController::update_todo"
        Rails.logger.info "Parameters:: #{params}"
        @existing_todo = Todo.find(params[:id])
        @existing_todo.user = User.first
        if @existing_todo.update(title: params[:todo][:title], description: params[:todo][:description])
            flash[:notice] = "Todo updated sucessfully!!"
            redirect_to "/todos/#{params[:id]}"
        else  
            render :edit_todo
        end
    end

    def destroy
        Rails.logger.info "Params: #{params}"
        Rails.logger.info "TodosController::destroy"
        @todo = Todo.find(params[:id]) 
        @todo.update(is_deleted: true)
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

    def invalid_url
        render '/404'
    end

end