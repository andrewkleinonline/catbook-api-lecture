require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'should be valid with a name and weight' do
    cat = Cat.new(name: 'Maru', weight: 12)
    expect(cat).to be_valid
  end

  it 'should be invalid without a name' do
    bad_cat = Cat.new(weight: 10)
    bad_cat.valid?
    expect(bad_cat.errors[:name]).to include("can't be blank")
    # alternative: expect(bad_cat).to_not be_valid
  end

  it 'should be invalid without a weight' do
    weightless_cat = Cat.new(name: 'Maru')
    weightless_cat.valid?
    expect(weightless_cat.errors[:weight]).to include("can't be blank")
    # alternative: expect(weightless_cat).to_not be_valid
  end

  it 'should not be fluffy be default' do
    cat = Cat.new(name: 'Maru', weight: 12)
    expect(cat.fluffy).to be(false)
  end

  it 'should know if it is fat' do
    cat = Cat.new(name: 'Maru', weight: 12)
    skinny_cat = Cat.new(name: 'Skinny', weight: 9)
    
    expect(cat.fat?).to be(true)
    expect(skinny_cat.fat?).to be(false)
  end

  it 'should be able to learn a new hobby'
end
