describe Project do
  it 'has a valid factory' do
    expect(build(:project).save).to be true
  end
  it 'is invalid without a name' do
    expect(build(:project, name: nil).save).to be false
  end
end
