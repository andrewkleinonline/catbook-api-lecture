require "rails_helper"

describe "Cats API" do
  describe "get /cats" do
    it 'returns a JSON collection of all of the cats' do
      Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
      Cat.create(name: 'Grumpy Cat', weight: 9, temperament: 'grumpy')

      get '/api/v1/cats'
      response_body = JSON.parse(response.body)
      binding.pry
      expect(response).to be_success
      expect(response_body.length).to equal(2)

    end
  end
end
