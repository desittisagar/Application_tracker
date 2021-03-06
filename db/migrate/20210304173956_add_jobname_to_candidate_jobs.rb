class AddJobnameToCandidateJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :candidate_jobs, :jobname, :string
    add_column :candidate_jobs, :candidatename, :string
  end
end
