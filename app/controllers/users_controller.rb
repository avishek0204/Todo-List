class UsersController < ApplicationController
    def new 
        Rails.logger.info "UsersController::new"
        @new_user = User.new
    end

    def create_user
        Rails.logger.info "UsersController::create_user"
        Rails.logger.info "params:: #{params}"
        user = params[:user]
        @new_user = User.new(username: user[:username], email: user[:email], password: user[:password])
        if @new_user.save
            flash[:notice] = "Welcome #{@new_user[:username]}, you are signed up now!"
            redirect_to "/todos"
        else
            Rails.logger.info "Inside else #{@new_user.inspect}"
            flash[:alert] = "Please enter valid details"
            render 'new'
        end
    end
end