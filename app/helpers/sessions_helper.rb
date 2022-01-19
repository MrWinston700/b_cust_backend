module SessionsHelper
    def set_current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end

    def current_users
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
end
