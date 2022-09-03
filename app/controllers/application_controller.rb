class ApplicationController < ActionController::Base
    include ApplicationHelper
    
    def invalid_url
        render '/404'
    end
end
