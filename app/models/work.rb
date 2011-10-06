class Work < ActiveRecord::Base
  belongs_to :user

  has_attached_file :work, :styles => { :thumb => '100x100' }
  validates_presence_of :work

  def to_param
    "#{id}-#{title}".downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
  end
end
