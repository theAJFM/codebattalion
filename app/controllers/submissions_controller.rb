class SubmissionsController < ApplicationController
  def index
    @submission_list = Submission.where(ID_HACKER_FKEY: params[:id])
    @status_list = {"ACC" => "Accepted", "WA" => "Wrong Answer", "ERR" => "Compilation Error", "TLE" => "Time Limit Exceeded"}
  end
end
