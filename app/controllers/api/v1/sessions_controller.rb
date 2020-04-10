class Api::V1::SessionsController < ApplicationController

    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            login!
            user_json = UserSerializer.new(@user).serialized_json
            render json: {
                logged_in: true,
                user: user_json
            }
        else
            render json: {
                logged_in: false,
                error: @user.errors.full_messages.to_sentence,
                status: :unprocessable_entity
            }            
        end
    end

    def get_current_user
        if logged_in?
            render json: {
                logged_in: true,
                user:  UserSerializer.new(current_user).serialized_json
            }
        else
            render json: {
                logged_in: false,
                error: "No one logged in!"
            }            
        end
    end

    def destroy
        logout!
        render json: {
            notice: "Successfully logged out",
            logged_in: false
        }, status: :ok
    end
end
