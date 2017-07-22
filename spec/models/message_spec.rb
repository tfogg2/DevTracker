describe Message do
  it 'has a valid factory' do
    expect(build(:message).save).to be true
  end
  it 'is invalid without a user' do
    expect(build(:message, user_id: nil).save).to be false
  end
end
