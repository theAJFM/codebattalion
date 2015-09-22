module LoginHelper
    # Logs in the given user.
    def log_in(user, user_type)
        session[:user_type] = user_type
        session[:user_id] = user.id
        user.lastlogintime = DateTime.now
        user.save
    end

    # Returns the current logged-in user (if any).
    def current_user
        return @current_user ||= Hacker.find_by(ID_USER_ACCOUNT_KEY: session[:user_id]) if session[:user_type] == "hacker"
        @current_user ||= ProblemSetter.find_by(ID_PROBLEM_SETTER_KEY: session[:user_id])
    end
    
    def current_user_type
        @current_user_type ||= session[:user_type]
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end
    
    def log_out
        session.delete(:user_type)
        session.delete(:user_id)
        @current_user = nil
        @current_user_type = nil
    end
end
