class LoginController < ApplicationController
    def create
        @hackerEmail = Hacker.find_by(email: params[:login][:usemail])
        @hackerUser = Hacker.find_by(username: params[:login][:usemail])
        @psetUser = ProblemSetter.find_by(username: params[:login][:usemail])
        if @hackerEmail != nil && @hackerEmail.password == params[:login][:password]
            log_in(@hackerEmail, "hacker")
            redirect_to problems_path
        elsif @hackerUser != nil && @hackerUser.password == params[:login][:password]
            log_in(@hackerUser, "hacker")
            redirect_to problems_path
        elsif @psetUser != nil && @psetUser.password == params[:login][:password]
            log_in(@psetUser, "pset")
            redirect_to create_problem_path
        else
            flash.now[:danger] = 'Invalid username/email and password combination'
            render 'index'
        end
    end
    
    def destroy
        log_out
        redirect_to root_url
    end
end
