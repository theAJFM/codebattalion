class SignupController < ApplicationController
    def index
        @created_hacker = Hacker.new
    end
    def create
        @validate= true;
        @created_hacker = Hacker.new(username: params[:signup][:username], email: params[:signup][:email], password: params[:signup][:password], rating:0)
        @validate = false if ProblemSetter.exists?(:username => params[:signup][:username])
        if @validate != false
            if @created_hacker.save
                log_in(@created_hacker, "hacker")
    		    redirect_to problems_path
    		else
    		    render 'index'
    		end
    	else 
    	    @created_hacker.errors.add("Username", " has already been taken")
    	    render 'index'
    	end
    end
end
