class StaticController < ApplicationController
    def home
        render json: {status: "works fo sure"}
    end
end