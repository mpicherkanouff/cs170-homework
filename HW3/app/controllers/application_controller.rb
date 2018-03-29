class ApplicationController < ActionController::Base

    before_action :set_current_user
    
    protected # prevents method from being invoked by a route
    def set_current_user
    
        if session[:user_id]
            if session[:provider] 
                @current_user ||= Movieuser.find(session[:user_id])
            #raise @current_user.inspect
            else     
                @current_user ||=  User.find(session[:user_id])
            end  
        end  
    
    
    end

end