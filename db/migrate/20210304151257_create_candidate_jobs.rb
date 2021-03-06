class CreateCandidateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_jobs do |t|
      t.integer :cid
      t.integer :jid
      t.boolean :status

      t.timestamps
    end
  end
end
