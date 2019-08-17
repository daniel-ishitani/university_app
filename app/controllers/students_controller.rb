class StudentsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    before_action :set_student, except: [:index, :new, :create]
    before_action :require_permission, only: [:edit, :update]

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

    def require_permission
        if current_user != @student
            flash[:error] = "You don't have permission to perform this action"
            redirect_to student_path(current_user)
        end
    end

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end
end