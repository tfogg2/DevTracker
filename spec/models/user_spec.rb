
describe User do
  it 'has a valid factory' do
    expect(build(:user).save).to be true
  end
  it 'is invalid without a name' do
    expect(build(:user, name: nil).save).to be false
  end
  it 'is invalid without an email' do
    expect(build(:user, email: nil).save).to be false
  end
end
