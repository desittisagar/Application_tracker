class AdminController < ApplicationController

    #before_action :require_user_logged_in!      #this method defined in application_controller-ensures user is logged in


    def number
        Rails.logger.debug("My object")
    end

    def otp
        #@admin = Admin.find_by(phone: parama[:phone])
        # if @admin.present?

        # else

        # end
        require("bundler")
		Bundler.require()

		#account_sid = 'AC1c125409ac0a8b482c131de9fee8f9e8'
		#auth_token = 'c40e3b18546f776bd43a21cb31b91f52'

		#@client = Twilio::REST::Client.new(account_sid, auth_token)
        session[:phone] = params[:phone]
		#@otp = 2345
        @otp = rand(1111..9999)
        session[:otp] = @otp
        Rails.logger.debug("OPPTTTPPPP ",session[:otp])
        #@country_code = "+91"

		#@client.messages.create(to: @country_code+"9804293059", from: "+18787898759", body: "this is your otp :" + @otp.to_s)
        #render plain: params[:phone]
    end

    def login
        #print "HI"
        #Rails.logger.debug(params[:otp1])
        @admin = Admin.find_by(phone: session[:phone])
        @user_otp = params[:otp1]
        len = @user_otp.length
        puts "user_entered ",params[:otp1][0,len]
        puts "generated ",session[:otp]
        if session[:otp].to_i == params[:otp1][0,len].to_i
            if @admin.present?
                # puts "First if"
                # puts session[:phone]
                redirect_to root_path, notice: "Logged in as Admin"
            else
                # @admin = Admin.new(admin_params)   
                # @admin.save
                # puts "second"
                @admin = Admin.create({phone: session[:phone]})
                redirect_to root_path, notice: "Logged in as Admin"
            end
        else
            flash[:alert] = "Wrong OTP"
            render :otp
        end
        # render plain:params[:otp]
    end

    def destroy
        session[:phone] = nil
        print session
        if session[:phone]
            print 12345
        end    
        Rails.logger.debug("My object: #{session.inspect}")
        reset_session
        redirect_to root_path, notice: "Admin Logged-out successfully."
    end

    def create
    end

    def post
        if session[:phone]
            @job = Job.create({title: params[:title], category: params[:category], yoe: params[:yoe], status: params[:status]})
            redirect_to root_path, notice: "Job successfully created"
        else
            #flash[:alert] = "Only logged-in admins can create jobs."
            redirect_to root_path, alert: "Only logged-in admins can create jobs."
        end
    end

    def joblist
        @jobs = Job.all
    end

    def edit
        @job = Job.find_by(id: params[:job_id])
    end

    def editpostjob
        if session[:phone]
            puts "ID ", params[:job_id]
            @job = Job.find_by(id: params[:job_id])
            if @job.update({title: params[:job][:title],category: params[:job][:category],yoe: params[:job][:yoe],status: params[:job][:status]})
                redirect_to admin_job_list_path, notice: "Job edited Successfully"
            end
        else
            redirect_to root_path, alert: "Need to be Admin to Edit Jobs"    
        end
    end

    def statuslist
        @candijobs = CandidateJob.all
    end

    def status
        @candijob = CandidateJob.find_by(id: params[:cjid])
    end

    def statusupdate
        if session[:phone]
            puts "CJID ", params[:cjid]
            @candijob = CandidateJob.find_by(id:params[:cjid])
            if @candijob.update({candidatename: params[:candidate_job][:candidatename],jobname: params[:candidate_job][:jobname],status: params[:candidate_job][:status]})
                redirect_to root_path, notice: "Candidate-Job Status successfully changed"
            end
        else
            redirect_to root_path, alert: "Need to be Admin to Edit Jobs"
        end
    end

    private

    # def admin_params
    #     params.require(:admin).permit(:phone)
    # end
end