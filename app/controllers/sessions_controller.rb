class SessionsController < ApplicationController
    def new
        Rails.logger.info "SessionsController::new"
    end

    def create
        Rails.logger.info "SessionController::create"
        user = User.find_by(email: params[:sessions][:email])
        if user.present? && user.authenticate(params[:sessions][:password])
            session[:user_id] = user[:id]
            flash[:sucess] = "Logged in sucessfully"
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
        flash[:notice] = "Logged out"
        redirect_to '/'
    end
end