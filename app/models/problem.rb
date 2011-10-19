# problem has multiple states available
#  1. open
#  2. closed
#  3. archived
class Problem < ActiveRecord::Base
  belongs_to :project

  def archive!
    self.status = 'archived'
    self.save!
  end

  def close!
    self.status = 'closed'
    self.save!
  end
end
