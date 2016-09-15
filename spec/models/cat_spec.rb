require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'should be valid with a name and weight' do
    cat = Cat.new(name: 'Maru', weight: 12)
    expect(cat).to be_valid
  end

  it 'should be invalid without a name' do
    bad_cat = Cat.new(weight: 10)
    expect(bad_cat).to_not be_valid
  end

  it 'should be invalid without a weight' do
    weightless_cat = Cat.new(name: 'Maru')
    expect(weightless_cat).to_not be_valid
  end
  it 'should not be fluffy be default'
  it 'should know if it is fat'
  it 'should be able to learn a new hobby'
end
