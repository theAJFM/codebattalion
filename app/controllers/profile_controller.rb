class ProfileController < ApplicationController
  def index
    @hacker_profile = Hacker.find_by(username: params[:id])
    if @hacker_profile.nil?
      redirect_to error_404_path
    end
  end
  def editprof
    current_user.username = params[:newusername]
    current_user.firstname = params[:newfirstname]
    current_user.lastname = params[:newlastname]
    current_user.email = params[:newemail]
    if current_user.save
        redirect_to profile_path(current_user.username)
  	else
  	    @hacker_profile = current_user
    		render 'edit'
  	end
  end
  
  def editpass
    @current_pass = current_user.password
    @oldvalid = true
    @matchvalid = true
    if params[:oldpass] != @current_pass
      @oldvalid = false
    end
    if params[:newpass] != params[:confirmpass]
      @matchvalid = false
    end
    
    current_user.password = params[:newpass]
    if @matchvalid == false or @oldvalid == false or !current_user.save
        if @matchvalid == false
          current_user.errors.add("New password and Validation password", "do not match")
        end
        if @oldvalid == false
          current_user.errors.add("Old Password", "is incorrect")
        end
    		render 'change_pass'
    else
        redirect_to profile_path(current_user.username)
  	end
  end
end
