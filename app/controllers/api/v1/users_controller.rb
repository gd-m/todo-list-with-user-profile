class Api::V1::UsersController < ApplicationController
    
    def create
        @user = User.new(users_params)
        if @user.save!
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

    private

    def users_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
