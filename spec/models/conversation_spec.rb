describe Conversation do
  it 'has a valid factory' do
    expect(build(:conversation).save).to be true
  end
  it 'is invalid without a project' do
    expect(build(:conversation, project_id: nil).save).to be false
  end
end
