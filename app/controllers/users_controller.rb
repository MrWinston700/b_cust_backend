class UsersController < ApplicationController
    def create
        user = User.create(
            email: params['user']['email'],
            password: params['user']['password'],
            password_confirmation: params['user']['password']
        )
        
        if user
            render json: {
                status: :created,
                user: { email: user.email, name: user.name }
            }
        else
            render json: { status: 500 }
        end
    end
end
