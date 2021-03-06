class CandidatejobController < ApplicationController

    before_action :require_user_logged_in!

    def apply
        #puts "Candidate ID ", Current.user.id
        if CandidateJob.where(cid: Current.user.id)
            @candi_jobs = CandidateJob.where(cid: Current.user.id)
            @row = Job.where(id: params[:job_id])
            @job = @row.pluck(:title)
            if @candi_jobs.find_by(jid: params[:job_id])
                redirect_to root_path, notice: "You have already applied for this Job. Please keep your Profile updated"
            else
                @candi_job = CandidateJob.create({candidatename: Current.user.name, jobname: @job, cid: Current.user.id, jid: params[:job_id], status: false})
                redirect_to root_path, notice: "You have successfully applied for the Job. Please keep your Profile updated"
            end    
        else
            @candi_job = CandidateJob.create({candidatename: Current.user.name, jobname: @job, cid: Current.user.id, jid: params[:job_id], status: false})
            redirect_to root_path, notice: "You have successfully applied for the Job. Please keep your Profile updated"
        end
    end
end