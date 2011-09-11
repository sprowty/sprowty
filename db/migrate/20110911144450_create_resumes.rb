class CreateResumes < ActiveRecord::Migration
  def self.up
    create_table :resumes do |t|
      t.string :title
      t.text :activities
      t.text :experience
      t.text :education
      t.text :sample_work
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :resumes
  end
end
