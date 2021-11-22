class Api::V1::FactsController < ApplicationController

    # GET /facts
    def index
        @facts = Fact.all
        render json: @facts
    end

    # GET /facts/:id
    def show
        find_fact
        render json: @fact
    end

    #POST /facts
    def create
        @fact = Fact.new(fact_params)
        if @fact.save
            render json: @fact
        else
            render error: {error: 'Unable to create task.'}, status: 400
        end
    end

    #PUT /facts/:id
    def update
        find_fact
        if @fact
            @fact.update(fact_params)
            render json: {message: 'Task successfully updated.'}, status: 200
        else
            render json: {error: 'Unable to update task.'}, status: 400
        end
    end

    #DELETE /facts/:id
    def destroy
        find_fact
        if @fact
            @fact.destroy
            render json: {message: 'Task successfully deleted.'}, status: 200
        else
            render json: {error: 'Unable to delete task.'}, status: 400
        end
    end

    private

    def fact_params
        params.require(:fact).permit(:likes, :user_id)
    end

    def find_fact
        @fact = Fact.find(params[:id])
    end
end
