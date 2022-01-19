class SessionsController < ApplicationController
    def create
        user = User
        .find_by(email: params["user"]["email"])
        .try(:authenticate, params["user"]["password"])

        if user
            session[:user_id] = user.id
            set_current_user
            render json: {
                status: :created,
                logged_in: true,
                user: { email: user.email, name: user.name, id: user.id }
            }
        else
            render json: { status: 401}
        end
    end

    def check_logged_in
    
        if current_users
            user = current_users
            render json: {
                logged_in: true,
                user: { email: user.email, name: user.name, id: user.id }
            }
        else 
            render json: {
                logged_in: false
            }
        end
    end

    def logout
        reset_session
        render json: { status: 200, logged_out: true}
    end
end
