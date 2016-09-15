require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'should be valid with a name and weight'
  it 'should be invalid without a name'
  it 'should be invalid without a weight'
  it 'should not be fluffy be default'
  it 'should know if it is fat'
  it 'should be able to learn a new hobby'
end
