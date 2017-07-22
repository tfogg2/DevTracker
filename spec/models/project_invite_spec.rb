describe ProjectInvite do
  it 'has a valid factory' do
    expect(build(:project_invite).save).to be true
  end
  it 'is invalid without a token' do
    expect(build(:project_invite, share_token: nil).save).to be false
  end
end
