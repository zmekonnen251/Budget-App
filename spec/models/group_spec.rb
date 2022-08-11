require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:all) do
    @category1 = Group.create(name: 'Category 1', author_id: 1)
    @category1.icon.attach(io: File.open(Rails.root.join('spec', 'images', 'test.jpg')), filename: 'test.jpg',
                           content_type: 'image/jpg')
  end

  it 'should have a name' do
    expect(@category1.name).to eq('Category 1')
    expect(@category1).to be_valid
  end

  it 'should be invalid wihtout a name' do
    @category1.name = nil
    expect(@category1).to be_invalid
  end

  it 'should be invalid wihtout a user' do
    @category1.author_id = nil
    expect(@category1).to be_invalid
  end
end
