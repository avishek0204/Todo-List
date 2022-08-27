class UsersController < ApplicationController
    def show_user_details
        @user = User.find_by(id: params[:id])
        Rails.logger.info "UsersController::show_user_details"
        Rails.logger.info "User:: #{@user.inspect}"
        @current_user_todo_pending = Todo.where(user_id: @user[:id], completed: false, is_deleted: false)
        @current_user_todo_completed = Todo.where(user_id: @user[:id], completed: true, is_deleted: false)
    end

    def all_users
        @all_users = User.all
    end

    def new 
        Rails.logger.info "UsersController::new"
        @new_user = User.new
    end

    def edit_user
        Rails.logger.info "UsersController::edit"
        Rails.logger.info "Params: #{params}"
        @existing_user = User.find_by(id: params[:id])

    end

    def create_user
        Rails.logger.info "UsersController::create_user"
        Rails.logger.info "params:: #{params}"
        user = params[:user]
        @new_user = User.new(username: user[:username], email: user[:email], password: user[:password])
        if @new_user.save
            flash[:notice] = "Welcome #{@new_user[:username]}, you are signed up now!"
            redirect_to "/users/#{@new_user[:id]}"
        else
            Rails.logger.info "Inside else #{@new_user.inspect}"
            flash[:alert] = "Please enter valid details"
            render 'new'
        end
    end

    def update_user_details
        Rails.logger.info "UsersController::update_user_details"
        Rails.logger.info "params:: #{params}"
        @existing_user = User.find_by(id: params[:id])
        if @existing_user.update(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
            flash[:notice] = "Details updated!!"
            redirect_to "/users/#{@existing_user[:id]}"
        else  
            flash[:alert] = "Something went wrong!!"
            render :edit_user
        end
    end
end