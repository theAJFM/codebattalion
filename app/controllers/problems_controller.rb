class ProblemsController < ApplicationController
    def index
        @algorithms = Problem.where(ID_BUNDLE_FKEY: 1)
        @machine_learning = Problem.where(ID_BUNDLE_FKEY: 2)
        @miscellaneous = Problem.where(ID_BUNDLE_FKEY: 3)
        @mathematics = Problem.where(ID_BUNDLE_FKEY: 4)
    end
    def single
        @problem_info = Problem.find_by(ID_PROBLEM_KEY: params[:id])
        @psetter = ProblemSetter.find_by(ID_PROBLEM_SETTER_KEY: @problem_info.ID_PROBLEM_SETTER_FKEY)
        @bundlename = Bundle.find_by(ID_BUNDLE_KEY: @problem_info.ID_BUNDLE_FKEY)
    end
    
    def create
        redirect_to error_404_path if current_user_type != "pset" or !logged_in?
        @bundle_select = []
        Bundle.all.each{|b| @bundle_select << [b.BundleName, b.id]}
        print @bundle_select
        @problems_input = Problem.new
    end
    
    def edit
        redirect_to error_404_path if current_user_type != "pset" or !logged_in?
        @bundle_select = []
        Bundle.all.each{|b| @bundle_select << [b.BundleName, b.id]}
        print @bundle_select
        @problem = Problem.find_by(ID_PROBLEM_KEY: params[:id])
    end
    
    def editprob
        @problemedit = Problem.find_by(ID_PROBLEM_KEY:params[:problem_edit][:probid])
        @problemedit.ProblemName = params[:problem_edit][:problemname]
        @problemedit.ProblemDescription = params[:problem_edit][:content]
        if @problemedit.valid?
            @problemedit.save
            redirect_to list_of_created_path
        else
            render 'edit'
        end
    end
    
    def list
        if current_user_type != "pset"
            redirect_to error_404_path
        else
            puts current_user_type
            @problems_created = Problem.where(ID_PROBLEM_SETTER_FKEY: current_user.id)
        end
    end
    
    def new
        @problemsave = Problem.new(ProblemName: params[:problem_input][:problemname], ProblemDescription: params[:problem_input][:content], TotalHackerSolved:0, ID_PROBLEM_SETTER_FKEY: current_user.id, ID_BUNDLE_FKEY: params[:bundle_option], Points: params[:point_option])
        if @problemsave.valid?
            @problemsave.save
            @input = params[:problem_input][:input]
            @output = params[:problem_input][:output]
            in_url, out_url = dropbox_connect(@input, @output, @problemsave.id)
            @testcase = TestCase.create(ID_PROBLEM_FKEY: @problemsave.id, TestCaseInputURL: in_url, TestCaseOutputURL: out_url)
            @testcase.save
            @psetter = ProblemSetter.find_by(ID_PROBLEM_SETTER_KEY: current_user.id)
            @psetter.totalproblemsuploaded += 1
            @psetter.save
        else
            render 'create'
        end
    end
    
    def submit_result
        @verdict = ""
        @language = params[:language]
        @problem_id = params[:submit_answer][:problem_id]
        @submissionsave = Submission.create(ID_PROBLEM_FKEY: @problem_id, ID_HACKER_FKEY: current_user.id, Language: @language)
        @submission_outputname = "answers/submission#{@submissionsave.id}.txt"
        @submissionsave.SubmissionOutputURL = @submission_outputname
        @code = params[:submit_answer][:code].split("\n")
        @code.each {|x| x.chomp!}
  	    @status = check_solution(@code, @language, @submission_outputname, @problem_id)
  	    print @status
  	    if @status == nil
  	        @submissionsave.Verdict = "TLE"
  	    elsif @status[0] == ''
  	        @submissionsave.Verdict = "ERR"
  	        @error_codes = @status[1]
  	    else
  	        @res = @status[0].split("\n")
  	        @res.each {|x| x.chomp!}
  	        @verdict = match_solution(@res, @problem_id)
  	        @submissionsave.Verdict = "WA"
  	        if @verdict == true
  	            @temppoint = Problem.find_by(ID_PROBLEM_KEY: @problem_id)
  	            @tempsub = Submission.find_by(Verdict: "ACC", ID_HACKER_FKEY: current_user.id, ID_PROBLEM_FKEY: @problem_id)
  	            if @tempsub == nil
  	                current_user.rating += @temppoint.Points
  	                current_user.save
  	            end
  	            @submissionsave.Verdict = "ACC"
  	        end
  	    end
  	    @submissionsave.save
    end
    
    def search
        @keyword = "%#{params[:search_query][:keyword]}%"
        @search_result = Problem.where("ProblemName like ?", @keyword)
    end
end
