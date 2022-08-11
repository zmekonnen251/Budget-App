require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Joe', email: 'mail@mail.com', password: 'password', password_confirmation: 'password') }

  it 'Should have name' do
    expect(subject.name).to eq('Joe')
    expect(subject).to be_valid
  end

  it 'Should have email' do
    expect(subject.email).to eq('mail@mail.com')
    expect(subject).to be_valid
  end

  it 'should have password' do
    expect(subject.password).to eq('password')
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = ''
    expect(subject).to_not be_valid
  end
end
