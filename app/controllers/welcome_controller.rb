class WelcomeController < ApplicationController
  def view
  end

  def index
    if logged_in? and current_user_type == "hacker"
      redirect_to problems_path
    elsif logged_in? and current_user_type == "pset"
      redirect_to create_problem_path
    end
  end
end
