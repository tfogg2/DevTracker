class ProjectInvite < ApplicationRecord
  belongs_to :project
  before_save :share_token


  def share_token
    self.share_token = SecureRandom.hex(13)
  end

end
