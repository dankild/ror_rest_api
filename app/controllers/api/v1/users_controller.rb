class Api::V1::UsersController < ApplicationController

    # GET /users
    def index
        @users = User.all 
        render json: @users
    end

    # GET /user/:id
    def show
        find_user
        render json: @user
    end

    #POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render error: {error: 'Unable to create User.'}, status: 400
        end
    end

    #PUT /users/:id
    def update
        find_user
        if @user
            @user.update(user_params)
            render json: {message: 'User successfully updated.'}, status: 200
        else
            render json: {error: 'Unable to update User.'}, status: 400
        end
    end

    #DELETE /users/:id
    def destroy
        find_user
        if @user
            @user.destroy
            render json: {message: 'User successfully deleted.'}, status: 200
        else
            render json: {error: 'Unable to delete User'}, status: 400
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end


end