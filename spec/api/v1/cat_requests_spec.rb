require "rails_helper"

describe "Cats API" do
  describe "get /cats" do
    it 'returns a JSON collection of all of the cats' do
      Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
      Cat.create(name: 'Grumpy Cat', weight: 9, temperament: 'grumpy')

      get '/cats'

      expect(response).to be_success

    end
  end
end
