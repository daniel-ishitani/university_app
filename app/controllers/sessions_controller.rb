class SessionsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]

    def new

    end

    def create
        student = Student.find_by(email: params[:sessions][:email].downcase)
        if student && student.authenticate(params[:sessions][:password])
            session[:student_id] = student.id
            flash[:success] = "Welcome!"
            redirect_to student
        else
            flash.now[:error] = 'Incorrect email or password'
            render 'new'
        end
    end

    def destroy
        session[:student_id] = nil
        flash[:success] = "Successfully logged out"
        redirect_to root_path
    end
end