describe UserProject do
  it 'has a valid factory' do
    expect(build(:user_project).save).to be true
  end
  it 'is invalid without a project' do
    expect(build(:user_project, project_id: nil).save).to be false
  end
  it 'is invalid without a user' do
    expect(build(:user_project, user_id: nil).save).to be false
  end
end
