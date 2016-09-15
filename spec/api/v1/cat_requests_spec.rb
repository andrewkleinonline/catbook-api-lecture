require "rails_helper"

describe "Cats API" do
  describe "get /cats" do
    it 'returns a JSON collection of all of the cats' do
      Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
      Cat.create(name: 'Grumpy Cat', weight: 9, temperament: 'grumpy')

      get '/api/v1/cats'
      response_body = JSON.parse(response.body)
      expect(response).to be_success
      expect(response_body.length).to equal(2)

    end
  end

  describe "get /cats/:id" do
    it 'returns a JSON collection of a single cat' do
      cat = Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
      Cat.create(name: 'Grumpy Cat', weight: 9, temperament: 'grumpy')

      get '/api/v1/cats/1'
      response_body = JSON.parse(response.body)
      expect(response).to be_success
      expect(response_body).to be_a(Hash)
      expect(response_body["name"]).to eq(cat.name)

    end
  end

  describe 'post /cats' do
    context 'when valid' do
      it 'creates a new cat' do
        post '/api/v1/cats', {cat: {name: "Mimi", breed: "pixie bob", temperament: "wild", weight: 7}}
        cat = Cat.first
        expect(Cat.count).to eq(1)
        expect(cat.name).to eq("Mimi")
      end
    end

    context 'when invalid' do
      it 'returns an error status and message' do
        post '/api/v1/cats', {cat: {breed: "pixie bob", temperament: "wild", weight: 7}}
        #binding.pry
        response_body = JSON.parse(response.body)

        expect(response.status).to eq(500)
        expect(response_body).to eq({"name" => ["can't be blank"]})
      end

    end
  end

  describe 'patch the cats' do
    context 'when valid' do
      it 'patches a cat' do
        Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
        Cat.create(name: 'Grumpy Cat', weight: 9, temperament: 'grumpy')

        patch '/api/v1/cats/1', {cat: {name: 'Andru', temperament: 'introspective & snarky'}}
        response_body = JSON.parse(response.body)

        expect(response).to be_success
        expect(response_body["name"]).to eq("Andru")
        expect(response_body["temperament"]).to eq("introspective & snarky")


      end
    end

    context 'when invalid' do
      it 'returns an error status and message' do
        Cat.create(name: 'Maru', weight: 12, temperament: 'curious')
        Cat.create(name: 'Grumpy Cat', weight: 9, temperament: 'grumpy')

        patch '/api/v1/cats/1', {cat: {name: nil}}
        #binding.pry
        response_body = JSON.parse(response.body)

        expect(response.status).to eq(500)
        expect(response_body).to eq({"name" => ["can't be blank"]})
      end
    end
  end

end
