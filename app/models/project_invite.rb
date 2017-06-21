class ProjectInvite < ApplicationRecord
  belongs_to :project
  # Before save does it EVERY time it's saved, not just on create
  # If we update it ever it will change the token... which shouldnt happen
  before_create :create_share_token

  # The field was called share_token, calling this method the same thing breaks
  # a lot of things, can't do that :) 
  def create_share_token
    # Don't update it if you don't need to! We never want this to change
    self.share_token = SecureRandom.hex(13) unless share_token
  end

end
