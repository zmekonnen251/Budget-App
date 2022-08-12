require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:all) do
    @entity1 = Entity.create(name: 'Entity 1', group_id: 1, author_id: 1)
  end

  it 'should be invalid wihout a name' do
    @entity1.name = nil
    expect(@entity1).to be_invalid
  end

  it 'should be invalid wihtout a group' do
    @entity1.group_id = nil
    expect(@entity1).to be_invalid
  end

  it 'should be invalid without a user' do
    @entity1.author_id = nil
    expect(@entity1).to be_invalid
  end
end
