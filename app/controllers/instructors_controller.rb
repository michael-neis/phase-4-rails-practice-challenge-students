class InstructorsController < ApplicationController

    before_action :find_instructor, only: [:show, :update, :destroy]

    def index
        render json: Instructor.all, status: :ok
    end

    def show
        render json: @inst, status: :ok
    end

    def update
        @inst.update!(instructor_params)
        render json: @inst, status: :accepted
    end

    def create
        new_inst = Instructor.create!(instructor_params)
        render json: new_inst, status: :created
    end

    def destroy
        @inst.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        @inst = Instructor.find(params[:id])
    end
end
