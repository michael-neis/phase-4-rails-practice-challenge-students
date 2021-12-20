class StudentsController < ApplicationController

    before_action :find_student, only: [:show, :update, :destroy]

    def index
        render json: Student.all, status: :ok
    end

    def show
        render json: @student, status: :ok
    end

    def update
        @student.update!(student_params)
        render json: @student, status: :accepted
    end

    def create
        new_student = Student.create!(student_params)
        render json: new_student, status: :created
    end

    def destroy
        @student.destroy
        head :no_content
    end


    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        @student = Student.find(params[:id])
    end

end
