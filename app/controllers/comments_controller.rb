class CommentsController < ApplicationController
    def show
        Rails.logger.info "CommentsController::show"
        @todo = Todo.find_by(id: params[:id])
        @comment = Comment.new
        if @todo.nil? || @todo[:is_deleted]
            render '/404'
        end
    end

    def add_comment
        Rails.logger.info "CommentsController::add_comment"
        Rails.logger.info "Params:: #{params}"
        Rails.logger.info "Session: #{session[:user_id]}"
        commented_by = User.find_by(id: session[:user_id])
        @new_comment = Comment.new(comment: params[:comment][:comment],todo_id: params[:id], commented_by: commented_by[:username])
        if @new_comment.save
            redirect_to "/todos/#{params[:id]}"
        else 
            render :show
        end
    end
end