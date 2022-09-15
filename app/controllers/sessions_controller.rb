class SessionsController < ApplicationController
    def new
        Rails.logger.info "SessionsController::new"
    end

    def create
        Rails.logger.info "SessionController::create"
        Rails.logger.info "Params:: #{params}"
        user = User.find_by(email: params[:sessions][:email])
        Rails.logger.info "User details:: #{user.inspect}"
        if user.present? && user.authenticate(params[:sessions][:password])
            session[:user_id] = user[:id]
            session[:admin] = user[:is_admin]
            redirect_to "/"
        else 
            Rails.logger.info "Inside else"
            flash.now[:alert] = "Invalid email and password combination"
            render 'new'
        end
        
    end

    def destroy
        Rails.logger.info "SessionController::destroy"
        session[:user_id] = nil
        redirect_to '/'
    end
end