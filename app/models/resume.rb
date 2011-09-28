class Resume < ActiveRecord::Base
  belongs_to :user

  def to_param
    "#{id}-#{title}".downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
  end

end
