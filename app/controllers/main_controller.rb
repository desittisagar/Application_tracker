class MainController < ApplicationController

    def index
        # flash[:notice] = "Logged in as User"
        # flash[:alert] = "Wrong user/pw"
        # if session[:user_id]
        #     @user = User.find_by(id: session[:user_id])
        # end
        @jobs = Job.where(status: true)
        @my_job_rows = CandidateJob.where(cid: Current.user)
        @my_job_ids = @my_job_rows.pluck(:jid)
        @my_jobs = Job.where(id: @my_job_ids)
        @status = @my_job_rows.pluck(:status)
        @combined = @my_jobs.zip(@status)
        puts "STATUS ", @combined
    end
end