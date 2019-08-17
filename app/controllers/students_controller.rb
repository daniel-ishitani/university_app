class StudentsController < ApplicationController
    before_action :set_student, except: [:index, :new, :create]

    def index
        @students = Student.all
    end

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            flash[:success] = "account created"
            redirect_to @student
        else
            render 'new'
        end
    end

    def edit

    end

    def update
        if @student.update(student_params)
            flash[:notice] = "Profile successfully updated."
            redirect_to @student
        else
            render 'edit'
        end
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end
end