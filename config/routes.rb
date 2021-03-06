Rails.application.routes.draw do
  get "/about-us", to: "about#index", as: :about  #use "as" for name
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  
  get "passwords", to: "passwords#edit", as: :edit_password
  patch "passwords", to: "passwords#update", as: :update_password

  get "passwords/reset", to: "passwords_reset#new"
  post "passwords/reset", to: "passwords_reset#create"

  get "passwords/reset/edit", to: "passwords_reset#edit"
  patch "passwords/reset/edit", to: "passwords_reset#update"

  get "profile", to: "profile#edit"
  patch "profile", to: "profile#update"

  get "admin_login", to: "admin#number"
  post "admin_login", to: "admin#otp"
  post "admin_set", to: "admin#login"
  delete "admin_logout", to: "admin#destroy"

  get "admin_create_jobs", to: "admin#create"   #for creating new jobs
  post "admin_create_jobs", to: "admin#post"    #for posting new jobs

  get "admin_job_list", to: "admin#joblist"     # list of all jobs
  get "admin_edit_jobs", to: "admin#edit"       #to edit existing jobs
  patch "admin_edit_jobs", to: "admin#editpostjob"     #edit and post job

  post "apply_jobs", to: "candidatejob#apply"     # to apply jobs

  get "candijob_statuslist", to: "admin#statuslist"       # to populate form with status
  get "candijob_status", to: "admin#status"
  patch "candijob_status", to: "admin#statusupdate"

  #get "/", to: "main#index"
  root to: "main#index"
  delete "logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
